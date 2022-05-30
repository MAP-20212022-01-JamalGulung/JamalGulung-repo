import 'package:flutter/material.dart';
import 'package:qidgym_management_system/ui/screens/home/home.dart';
import 'package:qidgym_management_system/ui/screens/membership/membership_body_current.dart';
// import 'package:qidgym_management_system/ui/screens/membership/part2.dart';


class MainPersistentTabBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car), text: "Non persistent",),
                Tab(icon: Icon(Icons.directions_transit), text: "Persistent"),
              ],
            ),
            title: const Text('Persistent Tab Demo'),
          ),
          body: const TabBarView(
            children: [
              MembershipCurrent(title: '',),
              Home(),
            ],
          ),
        ),
      );
  }
}