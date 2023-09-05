import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';

import '../../../screens/dashboard/inbox/chat_screen.dart';

class CallController extends GetxController {
  static const String appId = '418aa83d0e914d538031907d3eeda382';
  String channelName = 'test';
  String token =
      '007eJxTYPiad96+qnhBZo1wpO7T1ib//MXbHqcKcYe/yJD6WWjr9VmBwcTQIjHRwjjFINXS0CTF1NjCwNjQ0sA8xTg1NSXR2MLo1vXPKQ2BjAypO7+yMDJAIIjPwlCSWlzCwAAAY/UgsQ==';
  int uid = 0; // uid of the local user

  int? _remoteUid; // uid of the remote user
  bool _isJoined = false; // Indicates if the local user has joined the channel
  late RtcEngine agoraEngine; // Agora engine instance

  @override
  void onInit() {
    setupVoiceSDKEngine();
    // join();
    super.onInit();
  }

  showMessage(String message) {
    Get.showSnackbar(GetSnackBar(message: message));
  }

  Widget status() {
    String statusText;

    if (!_isJoined)
      statusText = 'Join a channel';
    else if (_remoteUid == null)
      statusText = 'Waiting for a remote user to join...';
    else
      statusText = 'Connected to remote user, uid:$_remoteUid';

    return Text(
      statusText,
    );
  }

  Future<void> setupVoiceSDKEngine() async {
    // retrieve or request microphone permission
    await [Permission.microphone].request();

    //create an instance of the Agora engine
    agoraEngine = createAgoraRtcEngine();
    await agoraEngine.initialize(const RtcEngineContext(appId: appId));

    // Register the event handler
    agoraEngine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          showMessage(
              "Local user uid:${connection.localUid} joined the channel");

          _isJoined = true;
          update();
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          showMessage("Remote user uid:$remoteUid joined the channel");

          _remoteUid = remoteUid;
          update();
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          showMessage("Remote user uid:$remoteUid left the channel");

          _remoteUid = null;
          update();

          if (reason == UserOfflineReasonType.userOfflineQuit) {
            // The remote user left the channel voluntarily.
            leave();
          }
        },
      ),
    );
    join();
  }

  void join() async {
    // Set channel options including the client role and channel profile
    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    );

    await agoraEngine.joinChannel(
      token: token,
      channelId: channelName,
      options: options,
      uid: uid,
    );
  }

  void leave() async {
    try {
      _isJoined = false;
      _remoteUid = null;
      update();

      agoraEngine.leaveChannel();
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('calls').get();

      if (querySnapshot.docs.isNotEmpty) {
        // Delete the entire document
        FirebaseFirestore.instance
            .collection('calls')
            .doc(querySnapshot.docs[0].id)
            .delete();
      }
      Get.off(() => ChatScreen());
    } catch (e) {
      // Handle errors
      print('Error removing document: $e');
    }
  }

// Clean up the resources when you leave
  @override
  void dispose() async {
    await agoraEngine.leaveChannel();
    super.dispose();
  }
}
