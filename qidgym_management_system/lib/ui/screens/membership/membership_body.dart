import 'package:flutter/material.dart';
// import 'package:qidgym_management_system/ui/screens/home/home.dart';
// import 'package:qidgym_management_system/ui/screens/membership/membership_body_current.dart';

class MainPersistentTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50), // Creates border
                color: Colors.greenAccent), //Change background color from here

            tabs: const [
              Tab(
                icon: Icon(Icons.directions_car),
                text: "Non persistent",
              ),
              Tab(icon: Icon(Icons.directions_transit), text: "Persistent"),
            ],
          ),
          title: const Text('Persistent Tab Demo'),
        ),
        body: const TabBarView(
          children: [],
        ),
      ),
    );
  }
}
