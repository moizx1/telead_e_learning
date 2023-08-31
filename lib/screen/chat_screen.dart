import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/constants/constants.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';

import '../controller/chat_screen_controller.dart';
import '../widget/message_stream.dart';

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
              title: args[1],
              trailing: Padding(
                padding: const EdgeInsets.only(right: 14),
                child: IconButton(
                  onPressed: ()=>controller.createCall(args[2].email, args[1]),
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
                      downloadImage: controller.downloadImage,
                      downloadVideo: controller.downloadVideo,
                    ),
                  ),
                  Container(
                    height: (controller.selectImages &&
                                controller.imageFileList.isNotEmpty) ||
                            (controller.selectVideo &&
                                controller.pickedVideo != null)
                        ? 200
                        : 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xffF5F9FF),
                      border: Border.all(
                        color: const Color(0xffE8F1FF),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (controller.selectImages &&
                            controller.imageFileList.isNotEmpty)
                          SizedBox(
                            height: 120,
                            child: controller.isUploading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ListView.builder(
                                    padding: const EdgeInsets.all(10),
                                    itemCount: controller.imageFileList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.blueGrey,
                                            ),
                                            child: Image.file(
                                              File(controller
                                                  .imageFileList[index].path),
                                            ),
                                          ),
                                          Positioned(
                                            top: -10,
                                            right: 0,
                                            child: IconButton(
                                              onPressed: () => controller
                                                  .removeImages(index),
                                              icon: const Icon(
                                                Icons.cancel_rounded,
                                                color: Colors.red,
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                          ),
                        if (controller.selectVideo &&
                            controller.pickedVideo != null)
                          SizedBox(
                            height: 120,
                            child: controller.isUploading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.blueGrey,
                                        ),
                                        child: Image.file(
                                          File(controller.pickedVideo!.path),
                                        ),
                                      ),
                                      Positioned(
                                        top: -10,
                                        right: 0,
                                        child: IconButton(
                                          onPressed: controller.removeVideos,
                                          icon: const Icon(
                                            Icons.cancel_rounded,
                                            color: Colors.red,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                          ),
                        Row(
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
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: const Color(0xffE8F1FF),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Get.back();
                                              controller.pickImages();
                                            },
                                            icon: const Icon(
                                              Icons.photo,
                                              size: 34,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Get.back();
                                              controller.pickVideos();
                                            },
                                            icon: const Icon(
                                              Icons.video_collection,
                                              size: 34,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.add),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: controller.onSend,
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
