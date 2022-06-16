import 'package:flutter/material.dart';
import 'package:qidgym_management_system/ui/screens/membership/admin/member_app_bar.dart';
import 'package:qidgym_management_system/ui/screens/membership/admin/member_list_body.dart';
import 'package:qidgym_management_system/ui/screens/membership/admin/member_list_view.dart';
// import 'membership.dart';

class MemberListScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const MemberListScreen());
  const MemberListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(24, 24, 24, 1),
        appBar: MemberListAppBar(),
        body: MemberListBody(),
      ),
    );
  }
}
