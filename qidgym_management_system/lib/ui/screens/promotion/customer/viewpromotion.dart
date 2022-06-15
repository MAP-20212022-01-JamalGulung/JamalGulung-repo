import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";

class ViewPromo extends StatefulWidget {
  final String docId;
  const ViewPromo({Key? key, required this.docId}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ViewPromoState(docId: this.docId);
}

class ViewPromoState extends State<ViewPromo> {
  String docId;
  ViewPromoState({required this.docId});

  final CollectionReference _promotion =
      FirebaseFirestore.instance.collection("Promotion");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color.fromRGBO(238, 29, 82, 1),
        title: Text("Promotion Details"),
      ),
      body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: FutureBuilder<DocumentSnapshot<Object?>>(
                future: _promotion.doc(docId).get(),
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

                  return Column(children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(data['pic']),
                              fit: BoxFit.cover),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['title'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.grey,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${data['start']} to ${data['end']}",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                data['desc'],
                                style: TextStyle(color: Colors.white,fontSize: 14),
                              ),
                            ]),
                      ),
                    )
                  ]);

                  // }).toList());
                }),
            // child: Column(children: [
            //   Expanded(
            //     flex: 1,
            //     child: Container(
            //       width: double.infinity,
            //       decoration: BoxDecoration(
            //         image: DecorationImage(image: AssetImage("assets/pink.jpg"),fit: BoxFit.cover),
            //         color: Colors.grey,
            //       ),
            //     ),
            //   ),
            //   SizedBox(
            //     height: 8.0,
            //   ),
            //   Expanded(
            //     flex: 3,
            //     child: Container(
            //       width: double.infinity,
            //       decoration: BoxDecoration(),
            //       child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               "Summer Body Challenge",
            //               style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w600),
            //             ),
            //             SizedBox(height: 30,),
            //             Text("Get 50% off for every Zumba session to burn off all the Raya's calorie. Let's get back in shape together!", style: TextStyle(color: Colors.grey),)

            //             ,SizedBox(height: 30,)
            //             ,
            //             Row(children: [
            //               Icon(Icons.calendar_today,color: Colors.white,size: 22,),
            //               SizedBox(width: 10,),
            //               Text(
            //               "May 4, 2022 to May 10, 2022",
            //               style: TextStyle(color: Colors.white,fontSize: 16),
            //             ),

            //             ],),
            //           ]),
            //     ),
            //   )
            // ]),
          )),
    );
  }
}
