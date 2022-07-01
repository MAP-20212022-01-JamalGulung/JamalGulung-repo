import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qidgym_management_system/services/membership/membership_service.dart';
import '../../model/member.dart';

class MembershipServiceFirebase extends MembershipService {
  @override
  Stream<List<MemberModel>> readMembership() => FirebaseFirestore.instance
      .collection('member')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => MemberModel.fromJson(doc.data()))
          .toList());

  @override
  Stream<List<MemberModel>> readActiveMembership() => FirebaseFirestore.instance
      .collection('member')
      .where('status', isEqualTo: "active")
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => MemberModel.fromJson(doc.data()))
          .toList());

  @override
  Stream<List<MemberModel>> readExpiredMembership() =>
      FirebaseFirestore.instance
          .collection('member')
          .where('status', isEqualTo: "expired")
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => MemberModel.fromJson(doc.data()))
              .toList());

  @override
  Future updateMembership(String memberID, int status) async {
    try {
      final docWM =
          FirebaseFirestore.instance.collection("member").doc(memberID);

      await docWM.update({
        'status': status,
      });
    } on Exception catch (e) {
      // return 100;
    }
  }
}
