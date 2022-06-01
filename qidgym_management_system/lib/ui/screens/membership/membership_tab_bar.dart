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
                                  child: Text('History',
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
      // backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
      // body: SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: <Widget>[
      //       SizedBox(
      //         height: heightInPercent(3, context),
      //       ),
      //       FlutterToggleTab(
      //         // width in percent
      //         width: 90,
      //         borderRadius: 30,
      //         height: 50,
      //         selectedIndex: _tabTextIndexSelected,
      //         selectedBackgroundColors: [const Color.fromRGBO(238, 29, 82, 1)],
      //         unSelectedBackgroundColors: [Color.fromARGB(255, 118, 118, 118)],
      //         selectedTextStyle: const TextStyle(
      //             color: Colors.white,
      //             fontSize: 18,
      //             fontWeight: FontWeight.w700),
      //         unSelectedTextStyle: const TextStyle(
      //             color: Colors.white,
      //             fontSize: 14,
      //             fontWeight: FontWeight.w500),
      //         labels: _listTextTabToggle,
      //         selectedLabelIndex: (index) {
      //           setState(() {
      //             _tabTextIndexSelected = index;

      //             if (index == '1') {
      //               MembershipCurrent(title: '');
      //             } else if (index == '2') {
      //               //call history body
      //             }
      //           });
      //         },
      //         isScroll: false,
      //       ),
      //       SizedBox(
      //         height: heightInPercent(3, context),
      //       ),
      //       Text(
      //         "Index selected : $_tabTextIndexSelected",
      //         style: const TextStyle(fontSize: 20, color: Colors.white),
      //       ),
      //       SizedBox(
      //         height: heightInPercent(3, context),
      //       ),
      //       const Divider(
      //         thickness: 2,
      //       ),
      //       // const MembershipCurrent(title: 'title'),
      //     ],
      //   ),
      // ),
      // // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
