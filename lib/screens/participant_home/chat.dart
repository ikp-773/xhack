// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatParticipant extends StatelessWidget {
  const ChatParticipant({Key? key, required this.catergory}) : super(key: key);
  final String catergory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catergory),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Spacer(),
          Container(
            height: 50,
            margin: EdgeInsets.fromLTRB(8, 0, 8, 10),
            padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: Get.width - 100,
                  child: TextField(
                      decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  )),
                ),
                Spacer(),
                Icon(
                  Icons.send_rounded,
                  color: Colors.blueAccent,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
