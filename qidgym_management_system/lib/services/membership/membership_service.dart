import 'package:qidgym_management_system/model/member.dart';

abstract class MembershipService {
  // Future addWashingMachine(double weight, double cold, double warm, double hot);

  Stream<List<MemberModel>> readMembership();

  Future updateMembership(String memberID, int status);

  Stream<List<MemberModel>> readActiveMembership();

  Stream<List<MemberModel>> readExpiredMembership();
}
