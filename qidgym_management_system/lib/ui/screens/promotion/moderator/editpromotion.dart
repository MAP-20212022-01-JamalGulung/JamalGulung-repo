import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EditPromo extends StatefulWidget {
  final String docId;
  const EditPromo({Key? key, required this.docId}) : super(key: key);
  @override
  State<StatefulWidget> createState() => EditPromoState(docId: this.docId);
}

class EditPromoState extends State<EditPromo> {
  final CollectionReference _promo =
      FirebaseFirestore.instance.collection("Promotion");
  String docId;
  EditPromoState({required this.docId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 24, 24, 1),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color.fromRGBO(238, 29, 82, 1),
        title: Text("Edit Promotion"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FutureBuilder<DocumentSnapshot<Object?>>(
            //     future: _promo.doc(docId).get(),
            //     // .where('day', isEqualTo: currentDay)
            //     // .snapshots(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasError) {
            //         return Text(
            //           'Something went wrong',
            //           style: TextStyle(color: Colors.white),
            //         );
            //       }

            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Text("Loading",
            //             style: TextStyle(color: Colors.white));
            //       }
            //       Map<String, dynamic> data =
            //           snapshot.data!.data() as Map<String, dynamic>;

            //       // return ListView(
            //       //     children: snapshot.data!.docs
            //       //         .map((DocumentSnapshot document) {
            //       //   data = document.data as Map<String, dynamic>;
            //       //   List<String> strArr = [];
            //       //   strArr = List.from(data!['day']);

            //       return Text(
            //         data['title'],
            //         style: TextStyle(color: Colors.white),
            //       );

            //       // }).toList());
            //     }),
            Text(
              "Edit promotion details",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 24),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      MdiIcons.tag,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Promotion title",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  // controller: _emailTextController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(40, 40, 41, 1),

                    // contentPadding: EdgeInsets.all(0.0),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2,
                            color: const Color.fromRGBO(238, 29, 82, 1)),
                        borderRadius: BorderRadius.circular(10)),

                    hintText: "Enter your email",
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      MdiIcons.calendarMonth,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Start date",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  // controller: _emailTextController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(40, 40, 41, 1),

                    // contentPadding: EdgeInsets.all(0.0),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2,
                            color: const Color.fromRGBO(238, 29, 82, 1)),
                        borderRadius: BorderRadius.circular(10)),

                    hintText: "Enter your email",
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      MdiIcons.calendarMonth,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Expiry date",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  // controller: _emailTextController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(40, 40, 41, 1),

                    // contentPadding: EdgeInsets.all(0.0),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2,
                            color: const Color.fromRGBO(238, 29, 82, 1)),
                        borderRadius: BorderRadius.circular(10)),

                    hintText: "Enter your email",
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.description,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  style: const TextStyle(color: Colors.white),
                  // controller: _emailTextController,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(40, 40, 41, 1),

                    // contentPadding: EdgeInsets.all(0.0),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2,
                            color: const Color.fromRGBO(238, 29, 82, 1)),
                        borderRadius: BorderRadius.circular(10)),

                    hintText: "Enter your email",
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.photo_library,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Banner image",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Upload image",
                        style: TextStyle(
                            color: Color.fromRGBO(238, 29, 82, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color.fromRGBO(238, 29, 82, 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Submit",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  onTap: () {},
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
