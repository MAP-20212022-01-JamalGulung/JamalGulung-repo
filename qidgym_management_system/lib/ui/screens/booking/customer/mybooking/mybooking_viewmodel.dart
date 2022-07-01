import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import 'package:qidgym_management_system/model/booking.dart';
import 'package:qidgym_management_system/model/bookingDetails.dart';
import 'package:qidgym_management_system/model/roomDetails.dart';
import 'package:qidgym_management_system/services/booking/booking_moderator_service.dart';
import 'package:qidgym_management_system/services/booking/booking_service.dart';
import 'package:qidgym_management_system/services/room/room_service.dart';

import '../../../../../services/world_time.dart';

class MyBookingViewModel extends Viewmodel {
  final RoomService _dbRoom = locator<RoomService>();
  final BookingModeratorService _dbBooking = locator<BookingModeratorService>();
  // BookingModeratorService get _bookingModeratorService =>

  Stream<List<Room>> readRoom() {
    return _dbRoom.readRoom();
  }

  Stream<List<BookingModel>> readAllBooking() {
    return _dbBooking.readAllBooking();
  }

  Stream<List<BookingModel>> readPendingBooking() {
    return _dbBooking.readPendingBooking();
  }

  Future deleteBooking({@required bookingID}) async {
    return await _dbBooking.deleteBooking(bookingID);
  }
}
