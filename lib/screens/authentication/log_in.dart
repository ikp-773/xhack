//ignore_for_file:prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xhack/screens/authentication/constants.dart';
import 'package:xhack/screens/domain_expert_home/home.dart';
import 'package:xhack/screens/participant_home/home.dart';
import 'package:xhack/services/auth.dart';
import 'package:xhack/services/domain_expert_database.dart';

class LogIn extends StatefulWidget {
  final bool isParticipant;

  const LogIn({Key? key, this.isParticipant = false}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  final AuthServices _auth = AuthServices();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 14.5),
              child: Text(
                'Welcome Back',
                style: TextStyle(
                  fontFamily: 'ChelaOne',
                  color: Colors.black,
                  fontSize: 35,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 20),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                      decoration:
                          textFieldDecoration.copyWith(hintText: 'Email'),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter a valid email' : null,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 20),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                      decoration:
                          textFieldDecoration.copyWith(hintText: 'Password'),
                      validator: (value) =>
                          value!.length < 6 ? 'Incorrect password' : null,
                      obscureText: true,
                      onChanged: (value) {
                        setState(
                          () {
                            password = value;
                          },
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {});
                        dynamic result =
                            await _auth.signInUsingMail(email, password);
                        var checkDomainExpert =
                            await DomainExpertDatabaseService()
                                .domainExpert
                                .doc(result.uid)
                                .get();

                        if (result == null) {
                          setState(() {
                            error = 'Could not Sign In with the Credentials';
                          });
                        } else if (checkDomainExpert.exists) {
                          Get.offAll(DomainExpertHome());
                        } else {
                          Get.offAll(ParticipantHome());
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                      margin: EdgeInsets.fromLTRB(23, 0, 23, 24),
                      decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 50,
                      width: 600,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    error,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
