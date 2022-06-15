import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qidgym_management_system/model/roomDetails.dart';
import 'package:qidgym_management_system/services/room/room_service.dart';

class RoomServiceFirebase extends RoomService {
  @override
  Stream<List<Room>> readRoom() => FirebaseFirestore.instance
      .collection('Room')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Room.fromJson(doc.data())).toList());
}
