// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xhack/screens/authentication/landing_page.dart';
import 'package:xhack/screens/domain_expert_home/categories.dart';
import 'package:xhack/services/auth.dart';

class DomainExpertHome extends StatefulWidget {
  const DomainExpertHome({Key? key}) : super(key: key);

  @override
  State<DomainExpertHome> createState() => _DomainExpertHomeState();
}

class _DomainExpertHomeState extends State<DomainExpertHome> {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hackathons'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async {
              _auth.signOut();
              Get.offAll(() => LandingPage());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.power_settings_new_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 30),
            child: Text(
              'Live Hackathons',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => DomainExpertCategories(title: 'Sustainathon'));
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[100],
              ),
              margin: const EdgeInsets.only(
                  left: 25, right: 25, bottom: 10, top: 10),
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  'Sustainathon',
                  style: TextStyle(color: Colors.blueGrey[500], fontSize: 20),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 30),
            child: Text(
              'Upcoming Hackathons',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          InkWell(
            onTap: () {
              Get.snackbar('Upcoming Hackathons',
                  'The selected Hackathon has not yet begun');
            },
            child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                margin: const EdgeInsets.only(
                    left: 25, right: 25, bottom: 10, top: 5),
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'COVID Rebound',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
