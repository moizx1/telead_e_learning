import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:telead_e_learning/widgets/video_player_screen.dart';

import '../controllers/dashboard/inbox/chat_screen_controller.dart';

class BubbleMessage extends StatelessWidget {
  const BubbleMessage({
    super.key,
    this.content,
    required this.messageType,
    required this.sender,
    required this.isMe,
    required this.time,
    required this.downloadImage,
    required this.downloadVideo,
  });

  final String sender, messageType;
  final String? content;
  final DateTime time;
  final bool isMe;
  final Function(String image) downloadImage, downloadVideo;

  @override
  Widget build(BuildContext context) {
    /// Size the [BubbleMessage] class to the intrinsic width of the child.
    return GetBuilder<ChatScreenController>(
        init: ChatScreenController(),
        builder: (controller) {
          return IntrinsicWidth(
            /// Replace [Card] with your [Bubble] class.
            child: messageType == 'IMAGE'
                ? Stack(
                    alignment: Alignment.topRight,
                    children: [
                      InkWell(
                        onTap: () =>
                            Get.toNamed('/viewImage', arguments: content),
                        child: Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 6,
                              color: isMe
                                  ? Colors.blueGrey
                                  : const Color(0xff4C935E),
                            ),
                          ),
                          child: Image.network(
                            content ?? '',
                            width: 180,
                            height: 180,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => downloadImage(content ?? ''),
                        icon: const Icon(Icons.download_for_offline_rounded),
                      ),
                    ],
                  )
                : messageType == 'VIDEO'
                    ? FutureBuilder<File>(
                        future: controller.generateThumbnail(content ?? ''),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData) {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 180, // Set the desired width
                                  height: 180, // Set the desired height
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      width: 6,
                                      color: isMe
                                          ? Colors.blueGrey
                                          : const Color(0xff4C935E),
                                    ),
                                    image: DecorationImage(
                                      image: FileImage(snapshot.data!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () =>
                                        downloadVideo(content ?? ''),
                                    icon: const Icon(
                                      Icons.download_for_offline_rounded,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => Get.to(
                                      VideoPlayerScreen(url: content ?? '')),
                                  icon: const Icon(
                                    Icons.play_circle,
                                    size: 36,
                                    color: Colors.white60,
                                  ),
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error loading video thumbnail');
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      )
                    : Container(
                        padding: const EdgeInsets.only(
                            left: 20, top: 20, bottom: 12, right: 13),
                        decoration: BoxDecoration(
                          color: isMe
                              ? const Color(0xffE8F1FF)
                              : const Color(0xff4C935E),
                          borderRadius: isMe
                              ? const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                )
                              : const BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          /// This ensures that the column height only take up as
                          /// much height as needed by the children.
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            /// This is your content.
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                content ?? '',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isMe
                                      ? const Color(0xff202244)
                                      : Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5.0),

                            /// This is your formatted time. We align it to the right.
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                DateFormat('hh:mm a').format(time),
                                style: TextStyle(
                                  fontSize: 11,
                                  color: isMe
                                      ? const Color(0xff202244)
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
          );
        });
  }
}
