//@@ -0,0 +1,62 @@
import "package:flutter/material.dart";
import 'package:map_mvvm/view.dart';
// import 'package:loading_indicator/loading_indicator.dart';
import 'package:qidgym_management_system/model/member.dart';
import 'package:qidgym_management_system/ui/screens/membership/admin/member_list_viewmodel.dart';

class MemberListViewExpired extends StatefulWidget {
  const MemberListViewExpired({Key? key}) : super(key: key);

  @override
  State<MemberListViewExpired> createState() => _MemberListViewExpired();
  // State<ProfileBody> createState() => _ProfileBodyState();
}

class _MemberListViewExpired extends State<MemberListViewExpired> {
  @override
  Widget build(BuildContext context) {
    // final member = Provider.of<List<MemberModel>>(context);
    return View<MemberListViewModel>(
        builder: (_, viewmodel) => StreamBuilder<List<MemberModel>>(
              stream: viewmodel.readExpiredMembership(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return Text("Loading");
                // }
                if (snapshot.hasData) {
                  final member = snapshot.data!;
                  return Column(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        children: member.map(buildMemberList).toList(),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ));
  }

  @override
  Widget buildMemberList(MemberModel member) =>
      ListView(scrollDirection: Axis.vertical, shrinkWrap: true, children: <
          Widget>[
        Column(children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(40, 40, 40, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.account_circle,
                              size: 30,
                              color: Colors.white,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                              child: Row(
                                children: [
                                  Text(
                                    member.name,
                                    // textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    " (" + member.status.toUpperCase() + ")",
                                    // textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.more_vert,
                                  color: Color.fromRGBO(238, 29, 82, 1),
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            // GestureDetector(
                            //     onTap: () {
                            //       // setState(() {
                            //       //   // There was a logic error here in your code, so changed it to work correctly
                            //       //   bID = book.bookingID;
                            //       // });
                            //       // showAlertDialog(context);
                            //     },
                            //     child: const Icon(
                            //       Icons.delete,
                            //       color: Color.fromRGBO(238, 29, 82, 1),
                            //     )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ]),
          ),
          SizedBox(
            height: 8,
          ),
        ])
      ]);
}
