import 'package:map_mvvm/map_mvvm.dart';
import 'package:meta/meta.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import '../../../../../model/member.dart';
import '../../../../../services/membership/membership_service.dart';

class MembershipViewmodel extends Viewmodel {
  MembershipService get _membershipService => locator<MembershipService>();

  // Future addWashingMachine(
  //     {@required weight, @required cold, @required warm, @required hot}) async {
  //   return await _washingMachineManagementService.addWashingMachine(
  //       weight, cold, warm, hot);
  // }

  Stream<List<MemberModel>> readWashingMachines() {
    return _membershipService.readMembership();
  }

  Future updateMembership({
    @required memberID,
    @required status,
  }) async {
    return await _membershipService.updateMembership(memberID, status);
  }

  // Future deleteWashingMachine({@required wmid}) async {
  //   return await _washingMachineManagementService.deleteWashingMachine(wmid);
  // }
}
