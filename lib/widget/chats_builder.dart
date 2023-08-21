import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'custom_listview_tile.dart';

class ChatsBuilder extends StatelessWidget {
  ChatsBuilder({super.key, this.onChatTap, this.stream, this.loggedInUser});
  final VoidCallback? onChatTap;
  final String? loggedInUser;
  Stream<QuerySnapshot<Object?>>? stream;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      // padding: const EdgeInsets.only(top: 10),
      stream: firestore.collection('chats').snapshots(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
                backgroundColor: Color.fromARGB(255, 190, 200, 204)),
          );
        }
        final allChats = snapshot.data!.docs;
        List<Chats> chats = [];
        for (var chat in allChats) {
          final List participants = chat['participants'];
          final List messages = chat['messages'];

          // final currentUser = loggedInUser;
          if (participants.contains(loggedInUser)) {
            final chatData = Chats(
              participants: participants,
              messages: messages,
            );
            chats.add(chatData);
          }
        }
        return ListView.builder(
          itemCount: chats.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CustomListviewTile(
              onTap: onChatTap,
              title: chats[index]
                  .participants
                  .firstWhere((element) => element != loggedInUser),
              description: Text(
                'Hi, Good Evening Bro.!',
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
                    '14:39',
                    style: const TextStyle(
                      color: Color(0xff545454),
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class Chats {
  final List participants, messages;

  Chats({
    required this.participants,
    required this.messages,
  });
}
