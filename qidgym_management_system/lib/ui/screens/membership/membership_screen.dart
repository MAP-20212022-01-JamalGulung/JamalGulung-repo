import 'package:flutter/material.dart';
import 'package:qidgym_management_system/ui/screens/membership/member_list_view.dart';
import 'membership.dart';

class MembershipScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const MembershipScreen());
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(24, 24, 24, 1),
        appBar: MembershipAppBar(),
        body: MembershipTabBar(
          title: '',
        ),
      ),
    );
  }
}
