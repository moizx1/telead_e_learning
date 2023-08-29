import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class BubbleMessage extends StatelessWidget {
  const BubbleMessage(
      {super.key,
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
    return IntrinsicWidth(
      /// Replace [Card] with your [Bubble] class.
      child: messageType == 'IMAGE' || messageType == 'VIDEO'
          ? Stack(
              alignment: Alignment.topRight,
              children: [
                InkWell(
                  onTap: () => Get.toNamed('/viewImage', arguments: content),
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 6,
                        color: isMe ? Colors.blueGrey : const Color(0xff4C935E),
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
                  onPressed: () => messageType=='Video'? downloadVideo(content ?? '') :downloadImage(content ?? ''),
                  icon: const Icon(Icons.download_for_offline_rounded),
                ),
              ],
            )
          : Container(
              padding: const EdgeInsets.only(
                  left: 20, top: 20, bottom: 12, right: 13),
              decoration: BoxDecoration(
                color: isMe ? const Color(0xffE8F1FF) : const Color(0xff4C935E),
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
                        color: isMe ? const Color(0xff202244) : Colors.white,
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
                        color: isMe ? const Color(0xff202244) : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
