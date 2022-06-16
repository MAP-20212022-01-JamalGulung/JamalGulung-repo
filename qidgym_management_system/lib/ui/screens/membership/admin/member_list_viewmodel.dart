import 'package:map_mvvm/map_mvvm.dart';
import 'package:meta/meta.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import '../../../../../model/member.dart';
import '../../../../../services/membership/membership_service.dart';

class MemberListViewModel extends Viewmodel {
  MembershipService get _membershipService => locator<MembershipService>();

  Stream<List<MemberModel>> readMembership() {
    return _membershipService.readMembership();
  }

  // Future<Map<dynamic, dynamic>>? getPersonalInfo() async {
  //   return _membershipService.readMembership();
  // }
}
