import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/app/service_locator.dart';

import '../../../services/profile/current_user.dart';
import '../../../services/profile/user.dart';

class ProfileViewModel extends Viewmodel {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController dpUrl = TextEditingController();

  final AuthService _authService = locator<AuthService>();
  final UserCollection _dbUser = locator<UserCollection>();

  Future updatePersonalInfo({
    required String name,
    required String email,
    required String nric,
    required String address,
    required String phone,
    required String userType,
    required String dpUrl,
  }) async {
    await _dbUser.updatePersonalInfo(
        name, email, nric, address, phone, userType, dpUrl);
  }

  Future<Map<dynamic, dynamic>>? getPersonalInfo() async {
    return _dbUser.getPersonalInfo();
  }

  Future getCurrentUser() async {
    return _authService.getCurrentUser();
  }
}
