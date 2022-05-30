import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qidgym_management_system/ui/screens/membership/member_list_view.dart';

import '../../../services/firebase.dart';
import '../../../services/member.dart';

class MemberListBody extends StatefulWidget {
  MemberListBody({Key? key}) : super(key: key);

  @override
  State<MemberListBody> createState() => _MemberListBodyState();
}

class _MemberListBodyState extends State<MemberListBody> {
  // final AuthService _auth = AuthService();
  List<String> staffList = <String>[
    "Jaipur",
    "Delhi",
    "Jodhpur",
    "Bikaner",
    "Mumbai"
  ];

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<MemberData>?>.value(
      value: DatabaseService().member,
      initialData: [],
      child: Container(
        child: MemberListView(),
      ),
    );
  }
}
