import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:flutter_toggle_tab/helper.dart';
import 'package:qidgym_management_system/ui/screens/membership/membership_body_current.dart';

class MembershipTabBar extends StatefulWidget {
  MembershipTabBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MembershipTabBar createState() => _MembershipTabBar();
}

class _MembershipTabBar extends State<MembershipTabBar> {
  var _tabTextIndexSelected = 1;
  var _tabTextIconIndexSelected = 0;
  var _tabIconIndexSelected = 0;
  var _tabSelectedIndexSelected = 0;

  final _listTextTabToggle = ["Current", "History"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 24, 24, 1),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              DefaultTabController(
                  length: 2, //length of tabs
                  initialIndex: 0,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: TabBar(
                            labelColor: const Color.fromRGBO(238, 29, 82, 1),
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(text: 'Current'),
                              Tab(text: 'History'),
                            ],
                          ),
                        ),
                        Container(
                            height: 400, //height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(children: <Widget>[
                              Container(
                                child: Center(
                                  child: MembershipCurrent(title: ''),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text('No History',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20,
                                          color: Colors.white)),
                                ),
                              ),
                            ]))
                      ])),
            ]),
      ),
      
    );
  }
}
