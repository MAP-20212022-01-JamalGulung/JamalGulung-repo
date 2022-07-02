import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:qidgym_management_system/services/world_time.dart';
import 'package:qidgym_management_system/ui/screens/promotion/customer/viewpromotion_screen.dart';
import 'dart:math' as math;
import '../../promotion/customer/viewpromotion.dart';

Map<String, dynamic>? data;

class HomeCustomerBody extends StatefulWidget {
  const HomeCustomerBody({Key? key}) : super(key: key);

  @override
  State<HomeCustomerBody> createState() => _HomeCustomerBodyState();
}

class _HomeCustomerBodyState extends State<HomeCustomerBody> {
  final CollectionReference _operation =
      FirebaseFirestore.instance.collection("OperationHour");
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(color: Color.fromRGBO(40, 40, 40, 1)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                getDay(),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 26,
                    color: Colors.white),
              ),
              Text(
                "$currentDate",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 34,
                    color: Colors.white),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder<DocumentSnapshot<Object?>>(
              future: _operation.doc(currentDay).get(),
              // .where('day', isEqualTo: currentDay)
              // .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'Something went wrong',
                    style: TextStyle(color: Colors.white),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading", style: TextStyle(color: Colors.white));
                }
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;

                // return ListView(
                //     children: snapshot.data!.docs
                //         .map((DocumentSnapshot document) {
                //   data = document.data as Map<String, dynamic>;
                //   List<String> strArr = [];
                //   strArr = List.from(data!['day']);

                return Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "OPEN HOURS from ${data['start']} to ${data['end']}",
                      //"hehe",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                );

                // }).toList());
              }),
          SizedBox(
            height: 50,
          ),
          Text(
            "Promotion",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w800, fontSize: 24),
          ),
          Text(
            "Recently Added",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 30,
          ),
          PromotionBox(context),
        ]),
      ),
    );
  }
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
