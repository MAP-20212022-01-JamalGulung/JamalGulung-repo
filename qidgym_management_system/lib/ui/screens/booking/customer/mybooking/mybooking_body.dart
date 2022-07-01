import 'package:flutter/material.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/mybooking/mybooking_viewAll.dart';
import 'package:qidgym_management_system/ui/screens/membership/admin/member_list_view.dart';

import 'mybooking_viewPending.dart';

// import 'package:qidgym_management_system/ui/screens/membership/membership_body_current.dart';
// class MyBookingBody extends StatefulWidget {
//   const MyBookingBody({Key? key}) : super(key: key);

//   @override
//   State<MyBookingBody> createState() => _MyBookingBody();
// }

// class _MemberListBody extends State<MemberListBody> {

class MyBookingBody extends StatelessWidget {
  const MyBookingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), // Creates border
              color: const Color.fromRGBO(238, 29, 82, 1),
            ), //Change background color from here

            tabs: const [
              Tab(text: "All"),
              Tab(text: "Pending"),
              // Tab(text: ""),
            ],
          ),
          // title: const Text('Persistent Tab Demo'),
          backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
        ),
        body: const TabBarView(
          children: [
            MyBookingViewAll(
              title: '',
            ),
            MyBookingViewPending(
              title: '',
            ), //list dari database
            // Text("sds"),
          ],
        ),
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
      ),
    );
  }
}
