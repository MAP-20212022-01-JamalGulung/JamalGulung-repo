import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
// import 'package:loading_indicator/loading_indicator.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/ui/screens/home/moderator/home_viewmodal.dart';
import 'package:qidgym_management_system/ui/screens/home/moderator/home_screen.dart';
import 'package:qidgym_management_system/services/world_time.dart';
import 'package:qidgym_management_system/ui/screens/promotion/moderator/promotionlist.dart';

class HomeModeratorBody extends StatefulWidget {
  const HomeModeratorBody({Key? key}) : super(key: key);

  @override
  State<HomeModeratorBody> createState() => _HomeModeratorBody();
}

class _HomeModeratorBody extends State<HomeModeratorBody> {
  final CollectionReference _operation =
      FirebaseFirestore.instance.collection("OperationHour");
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return View<HomeModeratorViewModel>(
      builder: (_, viewmodel) => FutureBuilder<Map>(
          future: viewmodel.getOperationHour("Sunday"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
              Text(data['start']);
            }
            return SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(40, 40, 40, 1)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                          GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Edit Schedule",
                                style: TextStyle(
                                    color: Color.fromRGBO(238, 29, 82, 1)),
                              ))
                        ],
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

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text("Loading",
                                  style: TextStyle(color: Colors.white));
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Promotion",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 24),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PromoList()));

                              },
                              child: Text(
                                "Edit Promotion",
                                style: TextStyle(
                                  color: Color.fromRGBO(238, 29, 82, 1),
                                ),
                              ))
                        ],
                      ),
                      Text(
                        "Recently Added",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      PromotionBox(context),

                      // ListView(
                      //   physics: NeverScrollableScrollPhysics(),
                      //   scrollDirection: Axis.vertical,
                      //   shrinkWrap: true,
                      //   children: [
                      //     GestureDetector(
                      //       onTap: () {
                      //         Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => const ViewPromo()),
                      //         );
                      //       },
                      //       child: Container(
                      //         width: double.infinity,
                      //         height: 150,
                      //         decoration: BoxDecoration(
                      //             image: DecorationImage(
                      //                 image: AssetImage("assets/blue.jpg"),
                      //                 fit: BoxFit.cover),
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
                      //                   style: TextStyle(
                      //                       color: Colors.white, fontSize: 20.0),
                      //                 ),
                      //               )
                      //             ],
                      //           )
                      //         ]),
                      //       ),
                      //     ),

                      //   ],
                      // )

                      // ListView(
                      //   scrollDirection: Axis.horizontal,
                      //   children: <Widget>[],
                      // )

                      //   Row(
                      //     mainAxisSize: MainAxisSize.max,
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //     GestureDetector(
                      //         onTap: () {Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const ViewPromo()),
                      // );
                      //         },
                      //         child: Container(
                      //           // decoration: BoxDecoration(color: Color.fromRGBO(158, 27, 117, 0.5),borderRadius: BorderRadius.circular(10)),
                      //           decoration: BoxDecoration(
                      //               image: DecorationImage(
                      //                   image: AssetImage("assets/pink.jpg"),
                      //                   fit: BoxFit.cover),
                      //               borderRadius: BorderRadius.circular(10)),
                      //           height: 280,
                      //           width: 160,
                      //           child: Stack(children: [
                      //             Container(
                      //               decoration: BoxDecoration(
                      //                   color: Color.fromRGBO(158, 27, 117, 0.6),
                      //                   borderRadius: BorderRadius.circular(10)),
                      //             ),
                      //             Column(
                      //               mainAxisAlignment: MainAxisAlignment.end,
                      //               children: [
                      //                 Padding(
                      //                   padding: const EdgeInsets.all(8.0),
                      //                   child: Text(
                      //                     "Summer Body Challenge",
                      //                     style: TextStyle(
                      //                         color: Colors.white, fontSize: 18),
                      //                   ),
                      //                 )
                      //               ],
                      //             )
                      //           ]),
                      //         ),
                      //       ),
                      //       Column(
                      //         mainAxisSize: MainAxisSize.max,
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Container(
                      //             // decoration: BoxDecoration(color: Color.fromRGBO(27, 117, 158, 0.5),borderRadius: BorderRadius.circular(10)),
                      //             decoration: BoxDecoration(
                      //                 image: DecorationImage(
                      //                     image: AssetImage("assets/blue.jpg"),
                      //                     fit: BoxFit.cover),
                      //                 borderRadius: BorderRadius.circular(10)),
                      //             height: 134,
                      //             width: 160,

                      //             child: Stack(children: [
                      //               Container(
                      //                 decoration: BoxDecoration(
                      //                     color: Color.fromRGBO(27, 117, 158, 0.6),
                      //                     borderRadius: BorderRadius.circular(10)),
                      //               ),
                      //               Column(
                      //                 mainAxisAlignment: MainAxisAlignment.end,
                      //                 children: [
                      //                   Padding(
                      //                     padding: const EdgeInsets.all(8.0),
                      //                     child: Text(
                      //                       "Merry May",
                      //                       style: TextStyle(
                      //                           color: Colors.white, fontSize: 18),
                      //                     ),
                      //                   )
                      //                 ],
                      //               )
                      //             ]),
                      //           ),
                      //           SizedBox(
                      //             height: 12,
                      //           ),
                      //           Container(
                      //             // decoration: BoxDecoration(color: Color.fromRGBO(117, 158, 27, 0.5),borderRadius: BorderRadius.circular(10)),
                      //             decoration: BoxDecoration(
                      //                 image: DecorationImage(
                      //                     image: AssetImage("assets/yellow.jpg"),
                      //                     fit: BoxFit.cover),
                      //                 borderRadius: BorderRadius.circular(10)),
                      //             height: 134,
                      //             width: 160,

                      //             child: Stack(children: [
                      //               Container(
                      //                 decoration: BoxDecoration(
                      //                     color: Color.fromRGBO(117, 158, 27, 0.6),
                      //                     borderRadius: BorderRadius.circular(10)),
                      //               ),
                      //               Column(
                      //                 mainAxisAlignment: MainAxisAlignment.end,
                      //                 children: [
                      //                   Padding(
                      //                     padding: const EdgeInsets.all(8.0),
                      //                     child: Text(
                      //                       "Zumba Raya",
                      //                       style: TextStyle(
                      //                           color: Colors.white, fontSize: 18),
                      //                     ),
                      //                   )
                      //                 ],
                      //               )
                      //             ]),
                      //           ),
                      //         ],
                      //       )
                      //     ],
                      //   ),
                    ]),
              ),
            );
          }),
    );
  }
}
