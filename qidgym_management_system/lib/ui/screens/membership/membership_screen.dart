import 'package:flutter/material.dart';
import 'membership.dart';

class MembershipScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const MembershipScreen());
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(237, 231, 226, 1.0),
        appBar: const MembershipAppBar(),
        body: MembershipCurrent(
          title: '',
        ),
        // floatingActionButton: const HomeFloat(),
      ),
    );
  }
}
