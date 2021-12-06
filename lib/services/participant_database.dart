import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xhack/models/particiant.dart';

class ParticipantDatabaseService {
  final String uid;
  ParticipantDatabaseService({this.uid = ''});

  final CollectionReference<Map<String, dynamic>> participant =
      FirebaseFirestore.instance.collection('participant');

  Future checkUserData(
      {required String name,
      required String mail,
      String? phoneNum,
      String? organization,
      int? age}) async {
    var checkCustomer = await participant.doc(uid).get();
    if (!checkCustomer.exists) {
      updateUserData(
        name: name,
        phoneNum: phoneNum ?? '',
        mail: mail,
        organization: organization ?? '',
        age: age ?? 18,
      );
    }
  }

// Push Data
  Future updateUserData(
      {String? name,
      String? mail,
      String? phoneNum,
      String? organization,
      int? age}) async {
    await participant.doc(uid).set({
      'name': name,
      'mail': mail,
      'phoneNum': phoneNum,
      'organization': organization,
      'age': age
    });
  }

// Pull Data
  ParticipantData _participantDataFromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return ParticipantData(
      uid: uid,
      name: snapshot.data()!['name'],
      mail: snapshot.data()!['mail'],
      phoneNum: snapshot.data()!['phoneNum'],
      organization: snapshot.data()!['organization'],
      age: snapshot.data()!['age'],
    );
  }
}
