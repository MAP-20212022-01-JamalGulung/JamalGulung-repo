import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qidgym_management_system/model/bookingDetails.dart';
import '../../model/booking.dart';

abstract class BookingModeratorService {
  Stream<List<BookingModel>> readBookingList();
  Stream<List<BookingModel>> readAllBooking();
  Future acceptBooking(String bookingID);
  Future rejectBooking(String bookingID);
  Future<String> getCustomerName(String uid);

  Future deleteBooking(String bookingID);
  Stream<List<BookingModel>> readPendingBooking();
}
