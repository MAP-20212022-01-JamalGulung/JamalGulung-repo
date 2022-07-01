import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:qidgym_management_system/ui/screens/promotion/moderator/editpromotion.dart';

Map<String, dynamic>? data;

class PromoListBody extends StatefulWidget {
  const PromoListBody({Key? key}) : super(key: key);
  @override
  State<PromoListBody> createState() => PromoListBodyState();
}

class PromoListBodyState extends State<PromoListBody> {
  @override
  void initState() {
    super.initState();
  }

  final CollectionReference _promotion =
      FirebaseFirestore.instance.collection("Promotion");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose a promotion to edit",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w800, fontSize: 24),
          ),
          SizedBox(height: 30),
          PromotionBox2(context),
        ],
      ),
    ));
  }
}

Widget PromotionBox2(BuildContext context) {
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
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
                              Text(
                                data!['title'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditPromo(
                                                    docId: document.id,
                                                  )),
                                        );
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Color.fromRGBO(238, 29, 82, 1),
                                      )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.delete,
                                    color: Color.fromRGBO(238, 29, 82, 1),
                                  )
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
              ],
            );
          }).toList(),
        );
      });
}
