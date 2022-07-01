import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import 'package:qidgym_management_system/services/operation_hour/operationHour_service.dart';

class HomeModeratorViewModel extends Viewmodel {
  final OperationHourService _dbOp = locator<OperationHourService>();

  Future<Map<dynamic, dynamic>>? getOperationHour(String day) async {
    return _dbOp.getOperationHour(day);
  }

  // Future getCurrentUser() async {
  //   return _authService.getCurrentUser();
  // }
}
