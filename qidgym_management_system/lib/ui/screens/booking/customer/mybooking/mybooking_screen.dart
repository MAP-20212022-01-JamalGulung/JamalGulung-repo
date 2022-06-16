import 'package:flutter/material.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/mybooking/mybooking_body.dart';
import 'mybooking_app_bar.dart';
// import 'membership.dart';

class MyBookingScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const MyBookingScreen());
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(24, 24, 24, 1),
        appBar: MyBookingAppBar(),
        body: MyBookingBody(),
      ),
    );
  }
}
