import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import 'package:qidgym_management_system/model/operationDetails.dart';
import 'package:qidgym_management_system/services/operation_hour/operationHour_service.dart';

class EditScheduleViewModel extends Viewmodel {
  final OperationHourService _dbOH = locator<OperationHourService>();
  Stream<List<OperationHour>> readBooking(String day) {
    return _dbOH.readOH(day);
  }

  Future updateOH({
    required String start,
    required String end,
    required String day,
  }) async {
    return await _dbOH.updateOH(start, end, day);
  }
}
