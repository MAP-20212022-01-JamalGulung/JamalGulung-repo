// import 'package: url_launcher/url_launcher.dart';
// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qidgym_management_system/ui/screens/login/thanku_page.dart';
import 'PasswordField.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/PersonData.dart';
import 'login.dart';
import 'register_view.dart';

class SignupPage2 extends StatefulWidget {
  final String email;
  final String password;
  SignupPage2({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  SignupPageState2 createState() =>
      SignupPageState2(email: this.email, password: this.password);
}

class SignupPageState2 extends State<SignupPage2> {
  String email;
  String password;

  SignupPageState2({required this.email, required this.password});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();
  PersonData person = PersonData();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool _isLoading = false;

  String? _validateName(String? value) {
    if (value!.isEmpty) return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'Please enter only alphabetical characters.';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value!.isEmpty) return 'Phone is required.';
    final RegExp _regExp = RegExp(r'^[0-9]+$');
    if (!_regExp.hasMatch(value)) {
      return 'Please enter only numerical characters.';
    }
    return null;
  }

  String? _validateNRIC(String? value) {
    if (value!.isEmpty) return 'NRIC is required.';
    final RegExp _regExp = RegExp(r'^[0-9]+$');
    if (!_regExp.hasMatch(value)) {
      return 'Please enter only numerical characters.';
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value!.isEmpty) return 'Address is required.';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    print(email + " " + password);
    // ignore: unnecessary_new
    return new Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(40, 40, 41, 1),
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: const Color.fromRGBO(40, 40, 41, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            )),
      ),
      // ignore: unnecessary_new
      body: new SafeArea(
        top: false,
        bottom: false,
        child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "You are almost there",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Finish creating your account...",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Enter your name',
                                    labelText: 'Name',
                                    labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    filled: true,
                                    fillColor: Color.fromRGBO(40, 40, 41, 1),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color:
                                                Color.fromRGBO(238, 29, 82, 1)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.person,
                                        size: 20.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  validator: _validateName,
                                  onSaved: (String? vale) {
                                    person.name = vale!; //vm
                                  },
                                  enabled: !_isLoading,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Enter your address',
                                    labelText: 'Address',
                                    labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    filled: true,
                                    fillColor: Color.fromRGBO(40, 40, 41, 1),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color:
                                                Color.fromRGBO(238, 29, 82, 1)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.location_pin,
                                        size: 20.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  validator: _validateAddress,
                                  onSaved: (String? vale) {
                                    person.address = vale!; //vm
                                  },
                                  enabled: !_isLoading,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Enter your phone number',
                                    labelText: 'Phone Number',
                                    labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    filled: true,
                                    fillColor: Color.fromRGBO(40, 40, 41, 1),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color:
                                                Color.fromRGBO(238, 29, 82, 1)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.local_phone_outlined,
                                        size: 20.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  validator: _validatePhone,
                                  onSaved: (String? vale) {
                                    person.phoneNumber = vale!; //vm
                                  },
                                  enabled: !_isLoading,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Enter your NRIC number',
                                    labelText: 'NRIC Number',
                                    labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    filled: true,
                                    fillColor: Color.fromRGBO(40, 40, 41, 1),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color:
                                                Color.fromRGBO(238, 29, 82, 1)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.contact_page_outlined,
                                        size: 20.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  validator: _validateNRIC,
                                  onSaved: (String? vale) {
                                    person.nric = vale!; //vm
                                  },
                                  enabled: !_isLoading,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Container(
                              padding: const EdgeInsets.only(top: 3, left: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                // border: Border(
                                //     bottom: BorderSide(color: Colors.grey),
                                //     top: BorderSide(color: Colors.grey),
                                //     right: BorderSide(color: Colors.grey),
                                //     left: BorderSide(color: Colors.grey))
                              ),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 60,
                                onPressed: () => _handleSubmitted(),
                                color: const Color.fromRGBO(238, 29, 82, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                child: const Text(
                                  "Sign Up",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  )),
            )),
      ),
    );
  }

  void _handleSubmitted() {
    final FormState? form = _formKey.currentState;
    if (!form!.validate()) {
      _autovalidateMode =
          AutovalidateMode.always; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before proceeding.');
    } else {
      form.save();
      setState(() {
        _isLoading = true;
      });
      UserAuth auth = UserAuth();
      person.email = email;
      person.password = password;
      print(person.email);
      print("password " + person.password);
      auth.createUser(person).then((UserCredential? user) {
        showInSnackBar('Signup successfull.');
        setState(() {
          _isLoading = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const ThankYouPage(title: 'Thank you Page')));
      }).catchError((e) {
        showInSnackBar('Sorry. Registration failed.');
        setState(() {
          _isLoading = false;
        });
        print(e);
        showInSnackBar(e);
      });
    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(value)));
  }
}
