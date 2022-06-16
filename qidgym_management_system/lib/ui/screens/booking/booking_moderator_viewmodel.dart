import 'package:map_mvvm/map_mvvm.dart';
import 'package:map_mvvm/viewmodel.dart';
import 'package:meta/meta.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import '../../../../../../model/booking.dart';
import '../../../../../../services/booking/booking_moderator_service.dart';
import '../../../app/service_locator.dart';
import '../../../model/booking.dart';
import '../../../services/booking/booking_moderator_service.dart';

class BookingModeratorViewModel extends Viewmodel {
  BookingModeratorService get _bookingModeratorService =>
      locator<BookingModeratorService>();

  Stream<List<BookingModel>> readBookingList() {
    return _bookingModeratorService.readBookingList();
  }

  Future acceptBooking({@required bookingID}) async {
    return await _bookingModeratorService.acceptBooking(bookingID);
  }

  Future rejectBooking({@required bookingID}) async {
    return await _bookingModeratorService.rejectBooking(bookingID);
  }

  Future<String> getCustomerName(String uid) async {
    return await _bookingModeratorService.getCustomerName(uid);
  }
}
