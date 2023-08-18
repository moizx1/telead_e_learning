import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';

import '../controller/chat_screen_controller.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final List<ChatMessage> _messages = [
    ChatMessage(
        sender: true,
        message: "Hello there!",
        time: "2020-06-17T10:29:35.000Z"),
    ChatMessage(
        sender: false, message: "Hello", time: "2020-06-17T10:29:35.000Z"),
    ChatMessage(
        sender: false,
        message: "Hi there! What are you doing today? Are you free?",
        time: "2020-06-16T10:29:35.000Z"),
    // Add more messages here
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreenController>(
        init: ChatScreenController(),
        builder: (controller) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'David Beckham',
              trailing: Padding(
                padding: const EdgeInsets.only(right: 14),
                child: IconButton(
                  onPressed: controller.onCallTap,
                  icon: Icon(Icons.local_phone_outlined, size: 24),
                ),
              ),
              showSearchIcon: true,
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
              child: Column(
                children: [
                  Expanded(
                    child: GroupedListView(
                      reverse: true,
                      elements: _messages,
                      groupBy: (element) => element.time,
                      // groupComparator: (value1, value2) => value2.compareTo(value1),
                      itemComparator: (item1, item2) =>
                          item1.time.compareTo(item2.time),
                      groupSeparatorBuilder: (value) {
                        var date = DateFormat('dd MMMM, EEEE')
                            .format(DateTime.tryParse(value)!);
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
                              date,
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
                          alignment: element.sender
                              ? Alignment.centerRight
                              : Alignment.centerLeft,

                          /// [ConstrainedBox] is used to provide the maximum width
                          /// of any one chat bubble.
                          child: ConstrainedBox(
                            /// In this case, let's use 300.0, but
                            /// you can use MediaQuery.of(context) and a percentage.
                            constraints: const BoxConstraints(
                                maxWidth: 300.0, minWidth: 130),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: BubbleMessage(
                                message: element.message,
                                sender: element.sender,
                                time: element.time,
                              ),
                            ),
                          ),
                        );
                      },
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
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 0),
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
                        Container(
                          height: 48,
                          width: 48,
                          decoration: const BoxDecoration(
                            color: Color(0xff0961F5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.mic_none_outlined,
                            color: Colors.white,
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

class BubbleMessage extends StatelessWidget {
  const BubbleMessage(
      {super.key,
      required this.message,
      required this.sender,
      required this.time});

  final String message, time;
  final bool sender;
  @override
  Widget build(BuildContext context) {
    /// Size the [BubbleMessage] class to the intrinsic width of the child.
    return IntrinsicWidth(
      /// Replace [Card] with your [Bubble] class.
      child: Container(
        padding:
            const EdgeInsets.only(left: 20, top: 20, bottom: 12, right: 13),
        decoration: BoxDecoration(
          color: sender ? const Color(0xffE8F1FF) : const Color(0xff4C935E),
          borderRadius: sender
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
                  color: sender ? const Color(0xff202244) : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 5.0),

            /// This is your formatted time. We align it to the right.
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                time,
                style: TextStyle(
                  fontSize: 11,
                  color: sender ? const Color(0xff202244) : Colors.white,
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

class ChatMessage {
  final bool sender;
  final String message;
  final String time;

  ChatMessage({
    required this.sender,
    required this.message,
    required this.time,
  });
}
