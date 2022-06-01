import 'package:cloud_firestore/cloud_firestore.dart';

class OperationHour {
  final String? uid;
  OperationHour({this.uid});

  final CollectionReference _opCollection =
      FirebaseFirestore.instance.collection('OperationHour');

  Future<Map> getOperationHour(String day) async {
    Map<String, dynamic> users;
    var res = await _opCollection.doc(day).get().then((ds) {
      users = {
        'start': ds['start'],
        'end': ds['end'],
      };
      return users;
    });
    return res;
  }

  Future<void> updateOperationHour(String day, String start, String end) async {
    await _opCollection.doc(day).update({
      'start': start,
      'end': end,
    });
  }
}
