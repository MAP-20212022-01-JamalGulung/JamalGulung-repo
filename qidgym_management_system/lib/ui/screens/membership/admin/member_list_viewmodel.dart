import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import 'package:qidgym_management_system/services/membership/membership_service.dart';
import '../../../../../model/member.dart';

class MemberListViewModel extends Viewmodel {
  // MembershipService get _membershipService => locator<MembershipServiceMo>();
  final MembershipService _dbBooking = locator<MembershipService>();

  Stream<List<MemberModel>> readMembership() {
    return _dbBooking.readMembership();
  }

  Stream<List<MemberModel>> readActiveMembership() {
    return _dbBooking.readActiveMembership();
  }

   Stream<List<MemberModel>> readExpiredMembership() {
    return _dbBooking.readExpiredMembership();
  }

  // Future<Map<dynamic, dynamic>>? getPersonalInfo() async {
  //   return _membershipService.readMembership();
  // }
}
