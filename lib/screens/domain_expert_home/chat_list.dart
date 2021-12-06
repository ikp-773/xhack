// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xhack/screens/participant_home/chat.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key, required this.categories}) : super(key: key);
  final String categories;
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categories),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.to(() => ChatParticipant(catergory: names[index]));
                },
                child: Container(
                  child: Row(
                    children: [SizedBox(width: 10), Text(names[index])],
                  ),
                ),
              )),
    );
  }
}

List names = ['Sam Ramesy'];
