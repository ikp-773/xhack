// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xhack/screens/authentication/log_in.dart';
import 'package:xhack/screens/authentication/sign_up.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
          children: [
            SizedBox(height: 200),
            Image.asset('assets/x_hack_logo.png'),
            Text(
              'Hackathon Management Made Easy',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ))),
                onPressed: () {
                  Get.to(() => LogIn());
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 10, 50, 10),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ))),
                onPressed: () async {
                  Get.to(() => SignUp());
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 10, 50, 10),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
