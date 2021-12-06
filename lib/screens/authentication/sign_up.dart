// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xhack/screens/domain_expert_home/home.dart';
import 'package:xhack/screens/participant_home/home.dart';
import 'package:xhack/services/auth.dart';

import 'constants.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final AuthServices _auth = AuthServices();

  String email = '';
  String password = '';
  String name = '';
  String organisation = '';
  String domain = '';
  int age = 18;

  String error = '';

  bool isDomainExpert = false;

  void selectRole(int x) {
    setState(() {
      if (x == 0) {
        isDomainExpert = false;
      } else {
        isDomainExpert = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcf5ff),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 150),
            Text(
              'Create an account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 38,
              ),
              textAlign: TextAlign.center,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 44, 25, 19),
                    child: TextFormField(
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        decoration:
                            textFieldDecoration.copyWith(labelText: 'Name'),
                        validator: (value) =>
                            value!.isAlphabetOnly ? 'Enter a valid name' : null,
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 19),
                    child: TextFormField(
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        decoration:
                            textFieldDecoration.copyWith(labelText: 'Email'),
                        validator: (value) =>
                            !value!.isEmail ? 'Enter a valid email' : null,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 19),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                      decoration:
                          textFieldDecoration.copyWith(labelText: 'Password'),
                      validator: (value) =>
                          value!.length < 6 ? 'Minimum 6 characters' : null,
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 19),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                      decoration: textFieldDecoration.copyWith(
                          labelText: 'Confirm Password'),
                      validator: (value) =>
                          value != password ? 'Passwords doesn\'t match' : null,
                      obscureText: true,
                      onChanged: (value) {
                        setState(
                          () {},
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 19),
                    child: TextFormField(
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        decoration: textFieldDecoration.copyWith(
                            labelText: 'Organization'),
                        validator: (value) =>
                            value!.isEmpty ? 'Cannot be empty' : null,
                        onChanged: (value) {
                          setState(() {
                            organisation = value;
                          });
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 19),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            selectRole(1);
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black),
                              color: !isDomainExpert
                                  ? Colors.blue
                                  : Colors.transparent,
                            ),
                            margin: EdgeInsets.only(right: 10),
                          ),
                        ),
                        GestureDetector(
                            onTap: () => selectRole(0),
                            child: Text('Participant')),
                        GestureDetector(
                          onTap: () => selectRole(1),
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black),
                              color: isDomainExpert
                                  ? Colors.blue
                                  : Colors.transparent,
                            ),
                            margin: EdgeInsets.only(right: 10, left: 30),
                          ),
                        ),
                        GestureDetector(
                            onTap: () => selectRole(1),
                            child: Text('Domain Expert')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 19),
                    child: TextFormField(
                        keyboardType: isDomainExpert
                            ? TextInputType.name
                            : TextInputType.phone,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        decoration: textFieldDecoration.copyWith(
                          labelText: !isDomainExpert ? 'Age' : 'Expert In',
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Cannot be empty' : null,
                        onChanged: (value) {
                          setState(() {
                            domain = value;
                            age = int.parse(value);
                          });
                        }),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {});
                        dynamic result = await _auth.signUpUsingEmail(
                          email,
                          password,
                          name: name,
                          age: age,
                          organization: organisation,
                          expertise: domain,
                          isParticipant: !isDomainExpert,
                        );
                        print(result);
                        print(result.uid);
                        if (result == null) {
                          setState(() {
                            error = 'Sign up failed using email';
                          });
                        } else if (isDomainExpert) {
                          Get.offAll(DomainExpertHome());
                        } else {
                          Get.offAll(ParticipantHome());
                        }
                      }
                    },
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                        margin: EdgeInsets.symmetric(horizontal: 23),
                        decoration: BoxDecoration(
                          color: Colors.blue[500],
                        ),
                        height: 50,
                        width: 600,
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              error,
              style: TextStyle(
                color: Colors.red,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
