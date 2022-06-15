import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import 'package:qidgym_management_system/model/bookingDetails.dart';
import 'package:qidgym_management_system/services/booking/booking_service.dart';

class BookingFormViewModel extends Viewmodel {
  final BookingService _dbBooking = locator<BookingService>();

  Stream<List<Book>> readBooking() {
    return _dbBooking.readBooking();
  }

  Future addBooking(
      {required String date,
      required String event_desc,
      required String event_name,
      required String slot}) async {
    return await _dbBooking.addBooking(date, event_desc, event_name, slot);
  }
}
