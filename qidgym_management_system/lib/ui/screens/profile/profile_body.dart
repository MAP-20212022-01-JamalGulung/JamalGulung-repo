import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:loading_indicator/loading_indicator.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import 'package:qidgym_management_system/ui/screens/profile/profile_viewmodal.dart';
import 'package:qidgym_management_system/ui/welcome.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final ProfileViewModel viewmodel = locator<ProfileViewModel>();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey _nameKey = new GlobalKey();
  final GlobalKey _phoneKey = new GlobalKey();
  final GlobalKey _addressKey = new GlobalKey();
  final GlobalKey _dpUrlKey = new GlobalKey();
  String name = "";
  String email = "";
  String nric = "";
  String phone = "";
  String address = "";
  String userType = "";
  String dpUrl = "";
  String _name = "";
  String _email = "";
  String _nric = "";
  String _phone = "";
  String _address = "";
  String _userType = "";
  String _dpUrl = "";
  File? imageFile;
  bool image = false;
  bool _isSigningOut = false;
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _openCamImage(BuildContext context) async {
      final pickedFile =
          await ImagePicker().getImage(source: ImageSource.camera);
      final pickedImageFile = File(pickedFile!.path);
      setState(() async {
        imageFile = pickedImageFile;
        image = true;
        dynamic result = await viewmodel.updateDp(imageFile: imageFile);
      });

      //Navigator.pop(context);
    }

    void _openLibImage(BuildContext context) async {
      final pickedFile =
          await ImagePicker().getImage(source: ImageSource.gallery);
      final pickedImageFile = File(pickedFile!.path);
      setState(() async {
        imageFile = pickedImageFile;
        image = true;
        dynamic result = await viewmodel.updateDp(imageFile: imageFile);
      });
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      alignment: Alignment.center,
      child: Container(
        child: View<ProfileViewModel>(
          builder: (_, viewmodel) => FutureBuilder<Map>(
              future: viewmodel.getPersonalInfo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map<String, dynamic> data =
                      snapshot.data as Map<String, dynamic>;
                  _name = data['name'] ?? '';
                  _email = data['email'] ?? '';
                  _nric = data['nric'] ?? '';
                  _phone = data['phone'] ?? '';
                  _address = data['address'] ?? '';
                  _userType = data['userType'] ?? '';
                  _dpUrl = data['dpUrl'] ?? '';
                  return ListView(
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(
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
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              offset: const Offset(0, 10))
                                        ],
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                NetworkImage(data['dpUrl']))),
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
                                          color: const Color.fromRGBO(
                                              40, 40, 41, 1),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                      backgroundColor:
                                                          Color.fromRGBO(
                                                              40, 40, 41, 1),
                                                      title: Text(
                                                        "Update Image",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: ListBody(
                                                          children: [
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            ListTile(
                                                              onTap: () async {
                                                                Navigator.of(
                                                                        ctx)
                                                                    .pop();
                                                                _openCamImage(
                                                                    context);
                                                              },
                                                              title: Center(
                                                                child: Text(
                                                                    "Camera"),
                                                              ),
                                                            ),
                                                            ListTile(
                                                              onTap: () async {
                                                                Navigator.of(
                                                                        ctx)
                                                                    .pop();
                                                                _openLibImage(
                                                                    context);
                                                              },
                                                              title: Center(
                                                                child: Text(
                                                                    "Library"),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
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
                                  child: Center(
                                    child: Text(
                                      data['userType'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16),
                                    ),
                                  )),
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
                                                backgroundColor: Color.fromRGBO(
                                                    40, 40, 41, 1),
                                                title: Text(
                                                  "Edit Name",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      TextFormField(
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        key: _nameKey,
                                                        initialValue:
                                                            '${data['name']}',
                                                        decoration:
                                                            InputDecoration(
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                        ),
                                                        validator: (val) => val!
                                                                .isEmpty
                                                            ? 'Please enter your full name'
                                                            : null,
                                                        onChanged: (val) {
                                                          setState(
                                                              () => name = val);
                                                        },
                                                      ),
                                                      ListTile(
                                                        onTap: () async {
                                                          Navigator.of(ctx)
                                                              .pop();
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            setState(() =>
                                                                loading = true);

                                                            if (name.isEmpty) {
                                                              setState(() {
                                                                name = _name;
                                                              });
                                                            }

                                                            dynamic result =
                                                                await viewmodel.updatePersonalInfo(
                                                                    name: name,
                                                                    email:
                                                                        _email,
                                                                    nric: _nric,
                                                                    phone:
                                                                        _phone,
                                                                    address:
                                                                        _address,
                                                                    dpUrl:
                                                                        _dpUrl,
                                                                    userType:
                                                                        _userType);
                                                          }
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
                                        backgroundColor:
                                            CupertinoColors.systemGrey),
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
                                        backgroundColor:
                                            CupertinoColors.systemGrey),
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
                                                backgroundColor: Color.fromRGBO(
                                                    40, 40, 41, 1),
                                                title: Text(
                                                  "Edit Phone",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      TextFormField(
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        key: _phoneKey,
                                                        initialValue:
                                                            '${data['phone']}',
                                                        decoration:
                                                            InputDecoration(
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                        ),
                                                        validator: (val) => val!
                                                                .isEmpty
                                                            ? 'Please enter your phone number'
                                                            : null,
                                                        onChanged: (val) {
                                                          setState(() =>
                                                              phone = val);
                                                        },
                                                      ),
                                                      ListTile(
                                                        onTap: () async {
                                                          Navigator.of(ctx)
                                                              .pop();
                                                          // deletePost(ID, context);
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            setState(() =>
                                                                loading = true);

                                                            if (phone.isEmpty) {
                                                              setState(() {
                                                                phone = _phone;
                                                              });
                                                            }

                                                            dynamic result = await viewmodel
                                                                .updatePersonalInfo(
                                                                    name: _name,
                                                                    email:
                                                                        _email,
                                                                    nric: _nric,
                                                                    phone:
                                                                        phone,
                                                                    address:
                                                                        _address,
                                                                    dpUrl:
                                                                        _dpUrl,
                                                                    userType:
                                                                        _userType);
                                                          }
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
                                                backgroundColor: Color.fromRGBO(
                                                    40, 40, 41, 1),
                                                title: Text(
                                                  "Edit Address",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      TextFormField(
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        key: _addressKey,
                                                        initialValue:
                                                            '${data['address']}',
                                                        decoration:
                                                            InputDecoration(
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                        ),
                                                        validator: (val) => val!
                                                                .isEmpty
                                                            ? 'Please enter your address'
                                                            : null,
                                                        onChanged: (val) {
                                                          setState(() =>
                                                              address = val);
                                                        },
                                                      ),
                                                      ListTile(
                                                        onTap: () async {
                                                          Navigator.of(ctx)
                                                              .pop();
                                                          // deletePost(ID, context);
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            setState(() =>
                                                                loading = true);

                                                            if (address
                                                                .isEmpty) {
                                                              setState(() {
                                                                address =
                                                                    _address;
                                                              });
                                                            }

                                                            dynamic result = await viewmodel
                                                                .updatePersonalInfo(
                                                                    name: _name,
                                                                    email:
                                                                        _email,
                                                                    nric: _nric,
                                                                    phone:
                                                                        _phone,
                                                                    address:
                                                                        address,
                                                                    dpUrl:
                                                                        _dpUrl,
                                                                    userType:
                                                                        _userType);
                                                          }
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
                        ),
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
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
                    Text("Loading")
                    // LoadingIndicator(
                    //     indicatorType: Indicator.ballClipRotatePulse,
                    //     colors: const [Color.fromRGBO(238, 29, 82, 1)],
                    //     strokeWidth: 2,
                    //     backgroundColor: Color.fromRGBO(24, 24, 24, 1),
                    //     pathBackgroundColor: Color.fromRGBO(24, 24, 24, 1)),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
