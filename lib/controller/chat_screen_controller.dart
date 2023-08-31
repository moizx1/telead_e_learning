import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../constants/app_keys.dart';

class ChatScreenController extends GetxController {
  ChatScreenController({this.loggedInUser, this.chatId, this.receiverId});
  final String? chatId, receiverId;
  final User? loggedInUser;

  String? type;
  String? receiverToken;
  final ImagePicker _imagePicker = ImagePicker();
  List<XFile> imageFileList = [];
  XFile? pickedVideo;
  late File videoThumbnail;
  List<String> downloadUrls = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  TextEditingController messageTextController = TextEditingController();
  Stream<QuerySnapshot<Object?>>? stream;
  late String messageString;
  bool selectImages = false, selectVideo = false, isUploading = false;

  @override
  void onInit() async {
    stream = firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('time', descending: true)
        .snapshots();
    final result = await firestore.collection('users').doc(receiverId).get();
    receiverToken = result['fcmToken'];
    super.onInit();
  }

  void createCall(String callerId, String receiverId) {
    firestore.collection('calls').add({
      'callerId': callerId,
      'receiverId': receiverId,
      // 'status': 'initiated', // You can update this as the call progresses
    });
  }

  void pickImages() async {
    if (imageFileList.isEmpty) {
      final List<XFile> selectedImages = await _imagePicker.pickMultiImage();
      if (selectedImages.isNotEmpty) {
        imageFileList.addAll(selectedImages);
      }
      selectImages = !selectImages;
      update();
    }
    // if (selectedImages.isNotEmpty) {
    //   for (XFile selectedImage in selectedImages) {
    //     // Check if the image has already been selected
    //     if (!imageFileList.contains(selectedImage)) {
    //       XFile file = selectedImage;
    //       imageFileList.add(file);
    //     }
    //   }
    // }
  }

  void pickVideos() async {
    if (pickedVideo == null) {
      final XFile? selectedVideo =
          await _imagePicker.pickVideo(source: ImageSource.gallery);
      if (selectedVideo != null) {
        pickedVideo = selectedVideo;
      }
      selectVideo = !selectVideo;
      update();
    }

    // if (selectedImages.isNotEmpty) {
    //   for (XFile selectedImage in selectedImages) {
    //     // Check if the image has already been selected
    //     if (!imageFileList.contains(selectedImage)) {
    //       XFile file = selectedImage;
    //       imageFileList.add(file);
    //     }
    //   }
    // }
  }

  void downloadImage(String imageUrl) async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    var response = await Dio()
        .get(imageUrl, options: Options(responseType: ResponseType.bytes));
    await ImageGallerySaver.saveImage(Uint8List.fromList(response.data),
        quality: 100, name: 'hello');
    Get.back();
    Get.defaultDialog(
        title: 'Completed',
        content: const Center(
          child: Text('Image saved to gallery.'),
        ),
        actions: [
          TextButton(
              onPressed: () {
                DismissAction;
                Get.back();
              },
              child: const Text('Ok'))
        ]);
  }

  void downloadVideo(String videoUrl) async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    final appDocDirectory = await getAppDocDirectory();
    final finalVideoPath = join(
      appDocDirectory.path,
      'Video-${DateTime.now().millisecondsSinceEpoch}.mp4',
    );
    final dio = Dio();
    await dio.download(
      videoUrl,
      finalVideoPath,
    );
    await saveDownloadedVideoToGallery(videoPath: finalVideoPath);
    await removeDownloadedVideo(videoPath: finalVideoPath);
    Get.back();
    Get.defaultDialog(
        title: 'Completed',
        content: const Center(
          child: Text('Image saved to gallery.'),
        ),
        actions: [
          TextButton(
              onPressed: () {
                DismissAction;
                Get.back();
              },
              child: const Text('Ok'))
        ]);
  }

  Future<Directory> getAppDocDirectory() async {
    if (Platform.isIOS) {
      return getApplicationDocumentsDirectory();
    }

    return (await getExternalStorageDirectory())!;
  }

  Future<void> saveDownloadedVideoToGallery({required String videoPath}) async {
    await ImageGallerySaver.saveFile(videoPath);
  }

  Future<void> removeDownloadedVideo({required String videoPath}) async {
    try {
      Directory(videoPath).deleteSync(recursive: true);
    } catch (error) {
      debugPrint('$error');
    }
  }

  Future<File> generateThumbnail(String url) async {
    final String? path = await VideoThumbnail.thumbnailFile(
      video: url,
      thumbnailPath: (await getTemporaryDirectory()).path,

      /// path_provider
      imageFormat: ImageFormat.PNG,
      maxHeight: 50,
      quality: 50,
    );
    return File(path ?? '');
  }

  void removeImages(index) {
    imageFileList.removeAt(index);
    if (imageFileList.isEmpty) selectImages = !selectImages;
    update();
  }

  void removeVideos() {
    pickedVideo = null;
    selectVideo = !selectVideo;
    update();
  }

  void onSend() async {
    messageString = messageTextController.text;
    messageTextController.clear();
    try {
      if (imageFileList.isNotEmpty) {
        // Upload images to Firebase Storage
        for (XFile image in imageFileList) {
          await sendImage(chatId, image, receiverToken);
        }
      } else if (messageString.isNotEmpty) {
        // Send text message to Firestore
        await sendMessage(chatId, messageString, receiverToken);
      } else {
        await sendVideo(chatId, pickedVideo, receiverToken);
      }
    } catch (e) {
      print("Error sending message or image: $e");
    }
  }

  Future<void> sendVideo(
      String? chatId, XFile? pickedVideo, String? receiverToken) async {
    isUploading = true;
    update();
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageRef = storage.ref();
    String fileName = basename(pickedVideo!.path);
    Reference imageRef = storageRef.child(fileName);

    try {
      await imageRef.putFile(File(pickedVideo.path));
      String downloadURL = await imageRef.getDownloadURL();
      await firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add(
        {
          'chatId': chatId,
          'content': downloadURL,
          'sender': loggedInUser?.email,
          'type': 'VIDEO',
          'time': DateTime.now()
        },
      );
      await firestore.collection('chats').doc(chatId).update(
        {
          'lastMessage': 'Video',
          'time': DateTime.now(),
        },
      );
      selectVideo = false;
      pickedVideo = null;
      isUploading = false;
      update();
      await sendNotification('Video', receiverToken ?? '');
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

  Future<void> sendImage(
      String? chatId, XFile image, String? receiverToken) async {
    isUploading = true;
    update();
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageRef = storage.ref();
    String fileName = basename(image.path);
    Reference imageRef = storageRef.child(fileName);

    try {
      await imageRef.putFile(File(image.path));
      String downloadURL = await imageRef.getDownloadURL();
      await firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add(
        {
          'chatId': chatId,
          'content': downloadURL,
          'sender': loggedInUser?.email,
          'type': 'IMAGE',
          'time': DateTime.now()
        },
      );
      await firestore.collection('chats').doc(chatId).update(
        {
          'lastMessage': 'Image',
          'time': DateTime.now(),
        },
      );
      selectImages = false;
      imageFileList = [];
      isUploading = false;
      update();
      if (receiverToken != null) {
        await sendNotification('Image', receiverToken);
      }
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

  Future<void> sendMessage(
      String? chatId, String messageString, String? receiverToken) async {
    try {
      await firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add(
        {
          'chatId': chatId,
          'content': messageString,
          'sender': loggedInUser?.email,
          'type': 'TEXT',
          'time': DateTime.now()
        },
      );
      await firestore.collection('chats').doc(chatId).update(
        {
          'lastMessage': messageString,
          'time': DateTime.now(),
        },
      );
      if (receiverToken != null)
        await sendNotification(messageString, receiverToken);
    } on FirebaseException catch (ex) {
      print(ex);
    }
  }

  Future<void> sendNotification(String body, String recipientToken) async {
    // Create the Firebase Cloud Messaging (FCM) request.
    Map<String, dynamic> request = {
      'notification': {
        'body': body,
        'title': 'New Message',
      },
      'data': {
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      },
      'to': recipientToken,
    };

    // Send the request to the FCM REST API.
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=${AppKeys.serverKey}',
      },
      body: jsonEncode(request),
    );
  }

  onCallTap() => Get.toNamed('/voiceCallScreen');
}
