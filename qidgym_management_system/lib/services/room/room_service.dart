import 'package:qidgym_management_system/model/roomDetails.dart';

abstract class RoomService {
  Stream<List<Room>> readRoom();
}
