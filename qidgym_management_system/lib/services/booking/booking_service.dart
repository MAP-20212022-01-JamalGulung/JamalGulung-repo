import 'package:qidgym_management_system/model/bookingDetails.dart';

abstract class BookingService {
  Stream<List<Book>> readBooking();

  Future addBooking(
      String date, String eventDesc, String eventName, String slot);
}
