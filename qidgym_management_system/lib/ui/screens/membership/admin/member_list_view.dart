import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:map_mvvm/view.dart';
// import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:qidgym_management_system/model/member.dart';
import 'package:qidgym_management_system/ui/screens/membership/admin/member_list_viewmodel.dart';
import 'package:qidgym_management_system/ui/screens/profile/profile_viewmodal.dart';

class MemberListView extends StatefulWidget {
  const MemberListView({Key? key}) : super(key: key);

  @override
  State<MemberListView> createState() => _MemberListView();
  // State<ProfileBody> createState() => _ProfileBodyState();
}

class _MemberListView extends State<MemberListView> {
  @override
  Widget build(BuildContext context) {
    // final member = Provider.of<List<MemberModel>>(context);

    return View<MembershipViewmodel>(
      builder: (_, viewmodel) => StreamBuilder<List>(
          stream: viewmodel.readMembership(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Card(
                          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                                leading: Icon(
                                  Icons.local_parking,
                                  color: Colors.blue.shade900,
                                ),
                                title: const Text(
                                    'Name: Idham Anur\n' + 'Status: Active '),
                                subtitle: Text('Exp Date: 29 July 2022'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
            return SizedBox();
          }),
    );
  }
}
