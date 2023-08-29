import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../screen/chat_screen.dart';
import 'bubble_message.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({
    super.key,
    required this.stream,
    this.loggedInUser,
    required this.downloadImage,
    required this.downloadVideo,
  });
  final String? loggedInUser;
  final Stream<QuerySnapshot<Object?>>? stream;
  final Function(String imageUrl) downloadImage, downloadVideo;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent),
          );
        }
        final messages = snapshot.data!.docs;
        List<BubbleMessage> messageBubbles = [];
        for (var message in messages) {
          final String? content = message['content'];
          final String messageSender = message['sender'];
          final String messageType = message['type'];
          final messageTime = message['time'].toDate();

          final currentUser = loggedInUser;

          final messageBubble = BubbleMessage(
            content: content,
            messageType: messageType,
            sender: messageSender,
            isMe: currentUser == messageSender,
            time: messageTime,
            downloadImage: downloadImage,
            downloadVideo: downloadVideo,
          );
          messageBubbles.add(messageBubble);
        }
        return GroupedListView(
          reverse: true,
          elements: messageBubbles,
          groupBy: (element) =>
              DateFormat('dd MMMM, EEEE').format(element.time),
          groupComparator: (value1, value2) => value2.compareTo(value1),
          itemComparator: (item1, item2) => item2.time.compareTo(item1.time),
          groupSeparatorBuilder: (value) {
            var date = value;
            return Align(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                decoration: BoxDecoration(
                  color: const Color(0xffE8F1FF),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 2,
                    color: const Color(0xffB4BDC4),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  date.toString(),
                  style: const TextStyle(
                    color: Color(0xff202244),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
          itemBuilder: (context, element) {
            return Align(
              alignment:
                  element.isMe ? Alignment.centerRight : Alignment.centerLeft,

              /// [ConstrainedBox] is used to provide the maximum width
              /// of any one chat bubble.
              child: ConstrainedBox(
                /// In this case, let's use 300.0, but
                /// you can use MediaQuery.of(context) and a percentage.
                constraints:
                    const BoxConstraints(maxWidth: 300.0, minWidth: 130),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BubbleMessage(
                    messageType: element.messageType,
                    content: element.content,
                    sender: element.sender,
                    isMe: element.isMe,
                    time: element.time,
                    downloadImage: element.downloadImage,
                    downloadVideo: element.downloadVideo,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
