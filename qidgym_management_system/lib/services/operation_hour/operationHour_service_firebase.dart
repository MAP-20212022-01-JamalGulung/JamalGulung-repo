import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qidgym_management_system/model/operationDetails.dart';
import 'package:qidgym_management_system/services/operation_hour/operationHour_service.dart';

class OperationHourServiceFirebase extends OperationHourService {
  @override
  Stream<List<OperationHour>> readOH(String day) => FirebaseFirestore.instance
      .collection('OperationHour')
      .where('day', isEqualTo: day)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => OperationHour.fromJson(doc.data()))
          .toList());

  @override
  Future updateOH(String start, String end, String day) async {
    final newOH =
        FirebaseFirestore.instance.collection("OperationHour").doc(day);
    OperationHour OHdetails = OperationHour(
      day: day,
      start: start,
      end: end,
    );

    newOH.update(OHdetails.toJson());

    Fluttertoast.showToast(
      msg: "Operation Hour Updated",
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
