// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:xhack/models/user.dart';
import 'package:xhack/services/domain_expert_database.dart';

import 'participant_database.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel _userFromFireBase(User user) {
    return UserModel(uid: user.uid);
  }

  Stream<UserModel> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFireBase(user!));
  }

  Future signUpUsingEmail(email, password,
      {bool isParticipant = true,
      String? name,
      String? organization,
      String? expertise,
      int? age}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      isParticipant
          ? ParticipantDatabaseService(uid: user!.uid).updateUserData(
              name: name,
              phoneNum: '',
              mail: email,
              organization: organization,
              age: age)
          : DomainExpertDatabaseService(uid: user!.uid).updateDomainExpertData(
              name: name,
              phoneNum: '',
              mail: email,
              organization: organization,
              expertise: expertise);
      return _userFromFireBase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInUsingMail(email, password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFireBase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
