import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import 'package:qidgym_management_system/model/bookingDetails.dart';
import 'package:qidgym_management_system/model/roomDetails.dart';
import 'package:qidgym_management_system/services/booking/booking_service.dart';
import 'package:qidgym_management_system/services/room/room_service.dart';

class BookingViewModel extends Viewmodel {
  final RoomService _dbRoom = locator<RoomService>();
  final BookingService _dbBooking = locator<BookingService>();

  Stream<List<Room>> readRoom() {
    return _dbRoom.readRoom();
  }

  Stream<List<Book>> readBooking() {
    return _dbBooking.readBooking();
  }
}
