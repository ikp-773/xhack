import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xhack/models/domain_expert.dart';

class DomainExpertDatabaseService {
  final String uid;
  DomainExpertDatabaseService({this.uid = ''});

  final CollectionReference<Map<String, dynamic>> domainExpert =
      FirebaseFirestore.instance.collection('domain_expert');

  Future checkUserData(
      {required String name,
      required String mail,
      String? phoneNum,
      String? organization,
      String? expertise}) async {
    var checkDomainExpert = await domainExpert.doc(uid).get();
    if (!checkDomainExpert.exists) {
      updateDomainExpertData(
        name: name,
        phoneNum: phoneNum ?? '',
        mail: mail,
        organization: organization ?? '',
        expertise: expertise ?? '',
      );
    }
  }

  Future updateDomainExpertData(
      {String? uid,
      String? name,
      String? mail,
      String? phoneNum,
      String? organization,
      String? expertise}) async {
    await domainExpert.doc(uid).set(
      {
        'name': name,
        'mail': mail,
        'phoneNum': phoneNum,
        'organization': organization,
        'expertise': expertise,
      },
    );
  }

  List<DomainExpertDataModel> _domainExpertListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) {
      return DomainExpertDataModel(
        uid: uid,
        name: doc.data()?['name'] ?? '',
        mail: doc.data()?['mail'] ?? '',
        phoneNum: doc.data()?['phoneNum'] ?? '',
        organization: doc.data()?['organization'] ?? '',
        expertise: doc.data()?['expertise'],
      );
    }).toList();
  }
}
