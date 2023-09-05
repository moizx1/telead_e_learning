import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';

import '../controller/widgets/video_player_controller.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(
        init: VideoController(url: url),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                  child:
                      // (controller.videoPlayerController.value.isInitialized)
                      //     ?
                      Chewie(
                controller: ChewieController(
                  videoPlayerController: controller.videoPlayerController,
                  autoPlay: true,
                  looping: true,
                  fullScreenByDefault: true,
                ),
              )
                  // : CircularProgressIndicator(), // Show loading indicator until video is initialized
                  ),
            ),
          );
        });
  }
}
