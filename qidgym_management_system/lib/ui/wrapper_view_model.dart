import 'package:map_mvvm/viewmodel.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import 'package:qidgym_management_system/services/profile/user_services.dart';

class WrapperViewmodel extends Viewmodel {
  final UserCollection _dbUser = locator<UserCollection>();

  Future<String> getUserType() async {
    return await _dbUser.getUserType();
  }
}
