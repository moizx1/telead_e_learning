import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'custom_listview_tile.dart';

class ChatsBuilder extends StatelessWidget {
  ChatsBuilder(
      {super.key, required this.onChatTap, this.stream, this.loggedInUser});
  final Function(String, String) onChatTap;
  final String? loggedInUser;
  final Stream<QuerySnapshot<Object?>>? stream;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      // padding: const EdgeInsets.only(top: 10),
      stream: stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
                backgroundColor: Color.fromARGB(255, 190, 200, 204)),
          );
        }
        final allChats = snapshot.data!.docs;
        List<Chat> chats = [];
        for (var chat in allChats) {
          final List participants = chat['participants'];

          // final currentUser = loggedInUser;
          if (participants.contains(loggedInUser)) {
            final String id = chat.id;
            final String messages = chat['lastMessage'];
            final DateTime time = chat['time'].toDate();
            final chatData = Chat(
              chatId: id,
              participants: participants,
              lastMessage: messages,
              time: time,
            );
            chats.add(chatData);
          }
          chats.sort((a, b) {
            return b.time.compareTo(a.time);
          });
        }
        return ListView.builder(
          itemCount: chats.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                onChatTap(
                  chats[index].chatId,
                  chats[index]
                      .participants
                      .firstWhere((element) => element != loggedInUser),
                );
              },
              child: CustomListviewTile(
                title: chats[index]
                    .participants
                    .firstWhere((element) => element != loggedInUser),
                description: Text(
                  chats[index].lastMessage,
                  style: const TextStyle(
                    color: Color(0xff545454),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(
                        color: Color(0xff0961F5),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '03',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      DateFormat('hh:mm a').format(chats[index].time),
                      style: const TextStyle(
                        color: Color(0xff545454),
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class Chat {
  final String chatId, lastMessage;
  final List participants;
  final DateTime time;
  Chat({
    required this.chatId,
    required this.participants,
    required this.lastMessage,
    required this.time,
  });
}
