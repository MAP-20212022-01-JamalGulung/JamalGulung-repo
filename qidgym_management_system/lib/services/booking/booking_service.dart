import 'package:qidgym_management_system/model/bookingDetails.dart';

abstract class BookingService {
  Stream<List<Book>> readBooking();

  // Stream<List<Book>> readAllBooking() async* {}

  // Stream<List<Book>> readPendingBooking();

  // Future deleteBooking(String bookingID);

  Future addBooking(
      String date, String eventDesc, String eventName, String slot);
}
