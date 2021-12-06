// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xhack/screens/authentication/landing_page.dart';
import 'package:xhack/screens/participant_home/chat.dart';
import 'package:xhack/services/auth.dart';

List categories = [
  'Coal Mining',
  'Metallurgy',
  'Gold Manufacturing',
  'Ceramics Processing',
];

class DomainExpertCategories extends StatefulWidget {
  const DomainExpertCategories({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<DomainExpertCategories> createState() => _DomainExpertCategoriesState();
}

class _DomainExpertCategoriesState extends State<DomainExpertCategories> {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 30),
          child: Text(
            'Make the change for a better tomorrow1',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, bottom: 10, top: 30),
              child: Text(
                'What’s Sustainathon?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, bottom: 10, top: 5),
              child: Text(
                'TCS Sustainathon invites you to become a driver for change by leveraging technology to solve real-world issues. Sustainathon provides a platform for the youth to collaborate with private companies, non-profit companies and organizations, and government agencies to co-create solutions in response to sustainability challenges.',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, bottom: 10, top: 20),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 65.0 * categories.length,
              child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(ChatParticipant(catergory: categories[index]));
                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[300],
                        ),
                        margin: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 10, top: 5),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(15, 16, 0, 18),
                        child: Text(
                          categories[index],
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
