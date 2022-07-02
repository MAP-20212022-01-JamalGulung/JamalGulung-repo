import 'package:flutter/material.dart';
import 'package:qidgym_management_system/ui/screens/home/customer/home.dart';
import 'package:qidgym_management_system/ui/screens/membership/admin/member_list_view.dart';
import 'package:qidgym_management_system/ui/screens/membership/admin/member_list_viewActive.dart';
import 'package:qidgym_management_system/ui/screens/membership/admin/member_list_viewExpired.dart';
import 'package:qidgym_management_system/ui/screens/membership/membership_body_current.dart';

// import 'package:qidgym_management_system/ui/screens/membership/membership_body_current.dart';
class MemberListBody extends StatefulWidget {
  const MemberListBody({Key? key}) : super(key: key);

  @override
  State<MemberListBody> createState() => _MemberListBody();
}

// class _MemberListBody extends State<MemberListBody> {

class _MemberListBody extends State<MemberListBody> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), // Creates border
              color: const Color.fromRGBO(238, 29, 82, 1),
            ), //Change background color from here

            tabs: const [
              Tab(text: "All"),
              Tab(text: "Active"),
              Tab(text: "Expired"),
            ],
          ),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              "Membership List",
              // textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
        ),
        body: const TabBarView(
          children: [
            // MemberListView(),
            MemberListView(),
            MemberListViewActive(), //list dari database
            MemberListViewExpired(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: const Text('Add New Member'),
          icon: const Icon(Icons.add, size: 30),
          backgroundColor: Colors.pink,
        ),
        backgroundColor: Color.fromRGBO(24, 24, 24, 1),
      ),
    );
  }
}
