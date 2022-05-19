import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qidgym_management_system/ui/screens/profile/edit_dp.dart';
import 'package:qidgym_management_system/ui/screens/profile/profile_viewmodal.dart';
import 'package:qidgym_management_system/ui/welcome.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ProfileState();
}

late final ProfileViewModel viewmodel;
final uid = FirebaseAuth.instance.currentUser!.uid;
String name = "";
String email = "";
String nric = "";
String phone = "";
String address = "";
String dpUrl = "";

class ProfileState extends State<Profile> {
  bool _isSigningOut = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "   Profile",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
          ),
          shape: const Border(
              bottom: BorderSide(
            color: Colors.grey,
            width: 1,
            style: BorderStyle.solid,
          )),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Users')
                    .doc(uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return new Text("Loading");
                  }
                  var data = snapshot.data;
                  name = data!['name'];
                  TextEditingController _name =
                      TextEditingController(text: name);
                  email = data['email'];
                  TextEditingController _email =
                      TextEditingController(text: email);
                  nric = data['nric'];
                  TextEditingController _nric =
                      TextEditingController(text: nric);
                  phone = data['phone'];
                  TextEditingController _phone =
                      TextEditingController(text: phone);
                  address = data['address'];
                  TextEditingController _address =
                      TextEditingController(text: address);
                  dpUrl = data['dpUrl'];
                  TextEditingController _dpUrl =
                      TextEditingController(text: dpUrl);
                  return ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: MaterialButton(
                          onPressed: () async {
                            setState(() {
                              _isSigningOut = true;
                            });
                            await FirebaseAuth.instance.signOut();
                            setState(() {
                              _isSigningOut = false;
                            });
                            Navigator.of(context, rootNavigator: true)
                                .pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return HomePage();
                                },
                              ),
                              (_) => false,
                            );

                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => Login()));
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: const FaIcon(
                              FontAwesomeIcons.arrowRightFromBracket,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(0, 10))
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(data['dpUrl']))),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1.5,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.edit),
                                    color: const Color.fromRGBO(40, 40, 41, 1),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const EditImage(),
                                          ));
                                    },
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Container(
                            width: 200,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(238, 29, 82, 1),
                            ),
                            child: const Center(
                              child: Text(
                                "Q1000",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                            )),
                      ),
                      const Center(
                        child: Text(
                          "ID",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 10),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: <Widget>[
                          const Expanded(
                            flex: 3,
                            child: Text(
                              "Name",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                          backgroundColor:
                                              Color.fromRGBO(40, 40, 41, 1),
                                          title: Text(
                                            "Edit Name",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  controller: _name,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                  ),
                                                ),
                                                ListTile(
                                                  onTap: () {
                                                    Navigator.of(ctx).pop();
                                                    // deletePost(ID, context);
                                                    print(_name.text);
                                                    viewmodel.updateData(
                                                        name: _name.text,
                                                        email: _email.text,
                                                        nric: _nric.text,
                                                        phone: _phone.text,
                                                        address: _address.text,
                                                        dpUrl: _dpUrl.text);
                                                  },
                                                  title: Center(
                                                    child: Text("Done"),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ));
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  name,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          const Expanded(
                            flex: 3,
                            child: Text(
                              "Email",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: CupertinoColors.systemGrey),
                              onPressed: () {},
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  data['email'],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          const Expanded(
                            flex: 3,
                            child: Text(
                              "IC no.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: CupertinoColors.systemGrey),
                              onPressed: () {},
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  data['nric'],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          const Expanded(
                            flex: 3,
                            child: Text(
                              "Phone",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                          backgroundColor:
                                              Color.fromRGBO(40, 40, 41, 1),
                                          title: Text(
                                            "Edit Phone",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  controller: _phone,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                  ),
                                                ),
                                                ListTile(
                                                  onTap: () {
                                                    Navigator.of(ctx).pop();
                                                    // deletePost(ID, context);
                                                    viewmodel.updateData(
                                                        name: _name.text,
                                                        email: _email.text,
                                                        nric: _nric.text,
                                                        phone: _phone.text,
                                                        address: _address.text,
                                                        dpUrl: _dpUrl.text);
                                                  },
                                                  title: Center(
                                                    child: Text("Done"),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ));
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  data['phone'],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          const Expanded(
                            flex: 3,
                            child: Text(
                              "Address",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                          backgroundColor:
                                              Color.fromRGBO(40, 40, 41, 1),
                                          title: Text(
                                            "Edit Address",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  controller: _address,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                  ),
                                                ),
                                                ListTile(
                                                  onTap: () {
                                                    Navigator.of(ctx).pop();
                                                    // deletePost(ID, context);
                                                    viewmodel.updateData(
                                                        name: _name.text,
                                                        email: _email.text,
                                                        nric: _nric.text,
                                                        phone: _phone.text,
                                                        address: _address.text,
                                                        dpUrl: _dpUrl.text);
                                                  },
                                                  title: Center(
                                                    child: Text("Done"),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ));
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  data['address'],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                }),
          ),
        ));
  }
}
