// import 'package: url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'PasswordField.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/PersonData.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  State createState() {
    return SignupPageState();
  }
}

class SignupPageState extends State<SignupPage> {
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

  String? _validatePassword(String? value) {
    final FormFieldState<String>? passwordField =
        _passwordFieldKey.currentState;
    if (passwordField!.value == null || passwordField.value!.isEmpty)
      return 'Please enter a password.';
    if (passwordField.value != value) return 'The passwords don\'t match';
    return null;
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) return 'Email is required.';
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
                                "Sign up",
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
                                "Create an Account,Its free",
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
                                  decoration: const InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Enter your name',
                                    labelText: 'Name',
                                    filled: true,
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
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your email address',
                                    labelText: 'Email',
                                    filled: true,
                                  ),
                                  validator: _validateEmail,
                                  onSaved: (String? vale) {
                                    person.email = vale!;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  enabled: !_isLoading,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                PasswordField(
                                  fieldKey: _passwordFieldKey,
                                  helperText: 'No more than 8 characters.',
                                  labelText: 'Password *',
                                  onSaved: (String? value) {
                                    setState(() {
                                      person.password = value!;
                                    });
                                  },
                                ),
                                const SizedBox(height: 20.0),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    border: const OutlineInputBorder(),
                                    filled: true,
                                    labelText: 'Re-type password',
                                  ),
                                  maxLength: 8,
                                  obscureText: true,
                                  validator: _validatePassword,
                                  enabled: !_isLoading,
                                ),
                                const SizedBox(
                                  height: 60.0,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account? ",
                                  style: TextStyle(color: Colors.white)),
                              InkWell(
                                child: const Text('Login Now',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login())),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            )),
      ),
    );
  }

  String? validateName(String? value) {
    if (value!.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }

  void _handleSubmitted() {
    final FormState? form = _formKey.currentState;
    if (!form!.validate()) {
      _autovalidateMode =
          AutovalidateMode.always; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      setState(() {
        _isLoading = true;
      });
      UserAuth auth = UserAuth();
      print(person.email);
      print("password " + person.password);
      auth.createUser(person).then((UserCredential? user) {
        showInSnackBar('Signup successfull.');
        setState(() {
          _isLoading = false;
        });
        Navigator.pop(context);
      }).catchError((e) {
        showInSnackBar('Error lah pulak.');
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
