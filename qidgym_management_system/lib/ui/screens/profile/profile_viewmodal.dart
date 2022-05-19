import 'package:flutter/cupertino.dart';
import 'package:qidgym_management_system/services/user.dart';

class ProfileViewModel extends ChangeNotifier {
  // TextEditingController name = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController nric = TextEditingController();
  // TextEditingController phone = TextEditingController();
  // TextEditingController address = TextEditingController();
  // TextEditingController dpUrl = TextEditingController();
  // late String name1;

  late final UserCollection _dbService;

  Future updateData({
    required String name,
    required String email,
    required String nric,
    required String phone,
    required String address,
    required String dpUrl,
  }) async {
    await _dbService.updatePersonalInfo(
        name, email, nric, phone, address, dpUrl);
  }
}
