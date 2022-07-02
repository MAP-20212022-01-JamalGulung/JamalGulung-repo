import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:qidgym_management_system/ui/screens/home/customer/home_view_chatBox.dart';
import 'package:qidgym_management_system/ui/screens/promotion/customer/viewpromotion_screen.dart';
import 'home.dart';
import 'package:qidgym_management_system/services/world_time.dart';
import 'package:qidgym_management_system/ui/screens/promotion/customer/viewpromotion.dart';
import 'dart:math' as math;

Map<String, dynamic>? data;

class HomeModerator extends StatefulWidget {
  const HomeModerator({Key? key}) : super(key: key);

  @override
  State<HomeModerator> createState() => _HomeModerator();
}

class _HomeModerator extends State<HomeModerator> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(24, 24, 24, 1),
        appBar: HomeModeratorAppBar(),
        body: HomeModeratorBody(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChatScreen()));
          },
          label: const Text('Inquiries'),
          icon: const Icon(Icons.headset_mic_rounded),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}

String getDay() {
  String day = "";

  if (currentDay == "Sunday") {
    day = "Sun";
  } else if (currentDay == "Monday") {
    day = "Mon";
  } else if (currentDay == "Tuesday") {
    day = "Tue";
  } else if (currentDay == "Wednesday") {
    day = "Wed";
  } else if (currentDay == "Thursday") {
    day = "Thu";
  } else if (currentDay == "Friday") {
    day = "Fri";
  } else if (currentDay == "Saturday") {
    day = "Sat";
  }

  return day;
}

Widget PromotionBox(BuildContext context) {
  return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Promotion').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            data = document.data() as Map<String, dynamic>;

            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewPromo(
                                docId: document.id,
                              )),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 125,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(data!['pic']),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color((math.Random().nextDouble() * 0xFFFFFF)
                                    .toInt())
                                .withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              data!['title'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            );
          }).toList(),

          // [
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const ViewPromo()),
          //     );
          //   },
          //   child: Container(
          //     width: double.infinity,
          //     height: 150,
          //     decoration: BoxDecoration(
          //         image: DecorationImage(
          //             image: AssetImage("assets/blue.jpg"),
          //             fit: BoxFit.cover),
          //         borderRadius: BorderRadius.circular(10)),
          //     child: Stack(children: [
          //       Container(
          //         decoration: BoxDecoration(
          //             color: Color.fromRGBO(158, 27, 117, 0.7),
          //             borderRadius: BorderRadius.circular(10)),
          //       ),
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: [
          //           Padding(
          //             padding: EdgeInsets.all(12.0),
          //             child: Text(
          //               "Summer Body Challenge",
          //               style: TextStyle(color: Colors.white, fontSize: 20.0),
          //             ),
          //           )
          //         ],
          //       )
          //     ]),
          //   ),
          // ),
          // ],
        );
      });

  // ListView(
  //   physics: NeverScrollableScrollPhysics(),
  //   scrollDirection: Axis.vertical,
  //   shrinkWrap: true,
  //   children: [
  //     GestureDetector(
  //       onTap: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => const ViewPromo()),
  //         );
  //       },
  //       child: Container(
  //         width: double.infinity,
  //         height: 150,
  //         decoration: BoxDecoration(
  //             image: DecorationImage(
  //                 image: AssetImage("assets/blue.jpg"), fit: BoxFit.cover),
  //             borderRadius: BorderRadius.circular(10)),
  //         child: Stack(children: [
  //           Container(
  //             decoration: BoxDecoration(
  //                 color: Color.fromRGBO(158, 27, 117, 0.7),
  //                 borderRadius: BorderRadius.circular(10)),
  //           ),
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               Padding(
  //                 padding: EdgeInsets.all(12.0),
  //                 child: Text(
  //                   "Summer Body Challenge",
  //                   style: TextStyle(color: Colors.white, fontSize: 20.0),
  //                 ),
  //               )
  //             ],
  //           )
  //         ]),
  //       ),
  //     ),
  //   ],
  // );
}
