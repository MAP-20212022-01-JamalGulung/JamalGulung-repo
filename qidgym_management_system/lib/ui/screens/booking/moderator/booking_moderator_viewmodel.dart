import 'package:map_mvvm/map_mvvm.dart';
import 'package:meta/meta.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import '../../../../../../model/booking.dart';
import '../../../../../../services/booking/booking_moderator_service.dart';

class BookingModeratorViewmodel extends Viewmodel {
  BookingModeratorService get _bookingModeratorService =>
      locator<BookingModeratorService>();

  // Future addWashingMachine(
  //     {@required weight, @required cold, @required warm, @required hot}) async {
  //   return await _washingMachineManagementService.addWashingMachine(
  //       weight, cold, warm, hot);
  // }

  Stream<List<BookingModel>> readBookingList() {
    return _bookingModeratorService.readBookingList();
  }
}
