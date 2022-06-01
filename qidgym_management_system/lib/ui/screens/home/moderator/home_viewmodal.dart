import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import 'package:qidgym_management_system/services/operation_hour/operation_hour.dart';

class HomeModeratorViewModel extends Viewmodel {
  final OperationHour _dbOp = locator<OperationHour>();

  Future updatePersonalInfo({
    required String day,
    required String start,
    required String end,
  }) async {
    await _dbOp.updateOperationHour(day, start, end);
  }

  Future<Map<dynamic, dynamic>>? getOperationHour(String day) async {
    return _dbOp.getOperationHour(day);
  }

  // Future getCurrentUser() async {
  //   return _authService.getCurrentUser();
  // }
}
