import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';

import '../controller/chat_screen_controller.dart';

class ChatScreen extends StatelessWidget {
  var args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreenController>(
        init: ChatScreenController(
            chatId: args[0], receiverId: args[1], loggedInUser: args[2]),
        builder: (controller) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'David Beckham',
              trailing: Padding(
                padding: const EdgeInsets.only(right: 14),
                child: IconButton(
                  onPressed: controller.onCallTap,
                  icon: const Icon(Icons.local_phone_outlined, size: 24),
                ),
              ),
              showSearchIcon: true,
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
              child: Column(
                children: [
                  Expanded(
                    child: MessageStream(
                      stream: controller.stream,
                      loggedInUser: controller.loggedInUser?.email,
                    ),
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xffF5F9FF),
                      border: Border.all(
                        color: const Color(0xffE8F1FF),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.messageTextController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 0,
                              ),
                              border: InputBorder.none,
                              hintText: 'Message',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xffA0A4AB),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.attach_file),
                        ),
                        InkWell(
                          onTap: controller.onSendPress,
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: const BoxDecoration(
                              color: Color(0xff0961F5),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              IconData(0xe571),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({super.key, required this.stream, this.loggedInUser});
  final String? loggedInUser;
  final Stream<QuerySnapshot<Object?>>? stream;
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
          final String messageText = message['message'];
          final messageSender = message['sender'];
          final messageTime = message['time'].toDate();

          final currentUser = loggedInUser;

          final messageBubble = BubbleMessage(
            sender: messageSender,
            message: messageText,
            isMe: currentUser == messageSender,
            time: messageTime,
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
                    message: element.message,
                    sender: element.sender,
                    isMe: element.isMe,
                    time: element.time,
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

class BubbleMessage extends StatelessWidget {
  const BubbleMessage(
      {super.key,
      required this.message,
      required this.sender,
      required this.isMe,
      required this.time});

  final String message, sender;
  final DateTime time;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    /// Size the [BubbleMessage] class to the intrinsic width of the child.
    return IntrinsicWidth(
      /// Replace [Card] with your [Bubble] class.
      child: Container(
        padding:
            const EdgeInsets.only(left: 20, top: 20, bottom: 12, right: 13),
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
                message,
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
