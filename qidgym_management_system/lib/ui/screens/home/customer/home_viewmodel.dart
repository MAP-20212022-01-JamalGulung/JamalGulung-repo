import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import 'package:qidgym_management_system/model/chat.dart';
import 'package:qidgym_management_system/services/world_time.dart';

class HomeCustomerViewModel extends Viewmodel {
  // final RoomService _dbRoom = locator<RoomService>();
  final HomeCustomerViewModel _dbBooking = locator<HomeCustomerViewModel>();

  Stream<List<ChatModel>> readChatMessage() {
    return _dbBooking.readChatMessage();
  }

  Future<void> addMessage() async {
    return _dbBooking.addMessage();
  }

  Future<void> clearMessage() async {
    return _dbBooking.clearMessage();
  }
}
