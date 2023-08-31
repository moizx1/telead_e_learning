import 'dart:convert';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:telead_e_learning/constants/constants.dart';
import '../utils/settings.dart' as utils;

class VoiceCallController extends GetxController {
  VoiceCallController({required this.isHost, required this.receiverId});
  bool isHost;
  String receiverId;

  String channelName = utils.channelId;
  String token = ''; 

  int uid = 0; // uid of the local user
  bool isJoined = false;
  int? _remoteUid; // uid of the remote user
  // bool isJoined = false; // Indicates if the local user has joined the channel
  // final bool _isHost =
  //     isHost; // Indicates whether the user has joined as a host or audience
  late RtcEngine agoraEngine; // Agora engine instance

  @override
  void onInit() async {
    await setupVideoSDKEngine();
    join();
    super.onInit();
  }

  Future<void> setupVideoSDKEngine() async {
    // retrieve or request camera and microphone permissions
    await [Permission.microphone, Permission.camera].request();

    //create an instance of the Agora engine
    agoraEngine = createAgoraRtcEngine();
    await agoraEngine.initialize(const RtcEngineContext(appId: utils.appId));

    print('check');
    // Register the event handler
    agoraEngine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          print("Local user uid:${connection.localUid} joined the channel");
          isJoined = true;
          update();
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          print("Remote user uid:$remoteUid joined the channel");
          _remoteUid = remoteUid;
          update();
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          print("Remote user uid:$remoteUid left the channel");
          _remoteUid = null;
          update();
        },
      ),
    );
  }

  void join() async {
    try {
      // Set channel options
      ChannelMediaOptions options;
      await agoraEngine.enableAudio();

      // Set channel profile and client role
      if (isHost) {
        options = const ChannelMediaOptions(
          clientRoleType: ClientRoleType.clientRoleBroadcaster,
          channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
        );
        await agoraEngine.startPreview();
      } else {
        options = const ChannelMediaOptions(
          clientRoleType: ClientRoleType.clientRoleAudience,
          channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
        );
      }

      await agoraEngine.joinChannel(
        token: token,
        channelId: channelName,
        options: options,
        uid: uid,
      );
    } catch (e) {
      print(e);
    }
  }

  void leave() {
    isJoined = false;
    _remoteUid = null;
    update();
    agoraEngine.leaveChannel();
    Get.back();
  }

// Release the resources when you leave
  @override
  void dispose() async {
    await agoraEngine.leaveChannel();
    agoraEngine.release();
    super.dispose();
  }

  showMessage(String message) {
    SnackBar(
      content: Text(message),
    );
  }
}
