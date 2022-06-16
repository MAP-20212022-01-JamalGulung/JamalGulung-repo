import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/booking.dart';

abstract class BookingModeratorService {
  Stream<List<BookingModel>> readBookingList();
  Future acceptBooking(String bookingID);
  Future rejectBooking(String bookingID);
  Future<String> getCustomerName(String uid);
}
