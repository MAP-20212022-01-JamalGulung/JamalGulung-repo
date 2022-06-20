import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qidgym_management_system/model/operationDetails.dart';

abstract class OperationHourService {
  Stream<List<OperationHour>> readOH(String day);

  Future updateOH(String start, String end, String day);

  Future<Map> getOperationHour(String day) async {
    Map<String, dynamic> users;
    var res = await FirebaseFirestore.instance
        .collection("Booking")
        .doc(day)
        .get()
        .then((ds) {
      users = {
        'start': ds['start'],
        'end': ds['end'],
      };
      return users;
    });
    return res;
  }
}
