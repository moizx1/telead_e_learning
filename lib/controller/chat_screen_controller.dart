import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import '../constants/app_keys.dart';

class ChatScreenController extends GetxController {
  ChatScreenController({this.loggedInUser, this.chatId, this.receiverId});
  final String? chatId, receiverId;
  final User? loggedInUser;

  late String receiverToken;
  final ImagePicker _imagePicker = ImagePicker();
  List<XFile> imageFileList = [];
  List<String> downloadUrls = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  TextEditingController messageTextController = TextEditingController();
  Stream<QuerySnapshot<Object?>>? stream;
  late String messageString;
  bool selectImages = false, isUploading = false, isDownloading = false;

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

  void downloadImage(String imageUrl) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference imageRef = storage.ref().child(imageUrl);
    final permissionStatus = await Permission.storage.status;
    if (permissionStatus.isDenied) {
      await Permission.storage.request();
    } else {
      try {
        // Get the application's document directory for storing the image
        final Directory appDir = await getApplicationDocumentsDirectory();
        final String fileName = basename(imageRef.fullPath);

        // Create a File to store the downloaded image
        final File localFile = File('${appDir.path}/$fileName');

        // Download the image to the local file
        await imageRef.writeToFile(localFile);

        // Print the local file path where the image is saved
        print('Image downloaded to: ${localFile.path}');
      } catch (e) {
        print('Error downloading image: $e');
      }
    }
  }

  void removeImages(index) {
    imageFileList.removeAt(index);
    if (imageFileList.isEmpty) selectImages = !selectImages;
    update();
  }

  onSendPress() async {
    messageString = messageTextController.text;
    messageTextController.clear();
    if (selectImages) {
      isUploading = !isUploading;
      update();
      Reference storageRef = storage.ref();
      for (XFile image in imageFileList) {
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
              'imageUrl': downloadURL,
              'message': null,
              'sender': loggedInUser?.email,
              'type': 'Image',
              'time': DateTime.now()
            },
          );
          await firestore.collection('chats').doc(chatId).update(
            {
              'lastMessage': 'Image',
              'time': DateTime.now(),
            },
          );
          await sendNotification('Image', receiverToken);
          imageFileList = [];
          selectImages = !selectImages;
          update();
        } catch (e) {
          print("Error uploading image: $e");
        }
      }
    } else if (messageString.isNotEmpty) {
      try {
        await firestore
            .collection('chats')
            .doc(chatId)
            .collection('messages')
            .add(
          {
            'chatId': chatId,
            'message': messageString,
            'imageUrl': null,
            'sender': loggedInUser?.email,
            'type': 'text',
            'time': DateTime.now()
          },
        );
        await firestore.collection('chats').doc(chatId).update(
          {
            'lastMessage': messageString,
            'time': DateTime.now(),
          },
        );
        await sendNotification(messageString, receiverToken);
      } on FirebaseException catch (ex) {
        print(ex);
      }
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
