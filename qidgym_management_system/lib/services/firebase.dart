import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qidgym_management_system/services/member.dart';

import 'member.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  final CollectionReference _memberCollection =
      FirebaseFirestore.instance.collection('member');

  List<MemberData> _memberListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MemberData(
        name: doc.get('name') ?? '',
        email: doc.get('email') ?? '',
        nric: doc.get('nric') ?? '',
        phone: doc.get('phone') ?? '',
        address: doc.get('address') ?? '',
        dpUrl: doc.get('dpUrl') ?? '',
        userType: doc.get('userType') ?? ''
          );
    }).toList();
  }

  Stream<List<MemberData>> get member {
    return _memberCollection.snapshots().map(_memberListFromSnapshot);
  }
}
