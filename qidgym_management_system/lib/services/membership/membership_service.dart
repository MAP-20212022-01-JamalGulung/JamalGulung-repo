import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/member.dart';

abstract class MembershipService {
  // Future addWashingMachine(double weight, double cold, double warm, double hot);

  Stream<List<MemberModel>> readMembership();

  Future updateMembership(String memberID, int status);

  // Future deleteWashingMachine(String wmid);
}

class MembershipServiceMock extends MembershipService {
  @override
  // Future addWashingMachine(
  //     double weight, double cold, double warm, double hot) async {
  //   try {
  //     final docWM =
  //         FirebaseFirestore.instance.collection("washingmachines").doc();

  //     final washingMachine = WashingMachineModel(
  //       wmId: docWM.id,
  //       wmWeight: weight,
  //       wmCold: cold,
  //       wmWarm: warm,
  //       wmHot: hot,
  //     );

  //     final map = washingMachine.toJson();

  //     await docWM.set(map);

  //     return 200;
  //   } on Exception catch (e) {
  //     return 100;
  //   }
  // }

  Stream<List<MemberModel>> readMembership() => FirebaseFirestore.instance
      .collection('member')
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

  // @override
  // Future deleteWashingMachine(String wmid) async {
  //   try {
  //     final docWM =
  //         FirebaseFirestore.instance.collection("washingmachines").doc(wmid);

  //     await docWM.delete();
  //   } on Exception catch (e) {
  //     return 100;
  //   }
  // }
}
