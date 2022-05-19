// import 'package: url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:qidgym_management_system/ui/screens/login/register2.dart';
import 'PasswordField.dart';
import '../../../model/PersonData.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  State createState() {
    return SignupPageState();
  }
}

class SignupPageState extends State<SignupPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();
  PersonData person = PersonData();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool _isLoading = false;
  bool _obscureText = true;

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
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your email address',
                                    labelText: 'Email',
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
                                        Icons.mail_outline,
                                        size: 20.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  validator: _validateEmail,
                                  controller: _emailTextController,
                                  onSaved: (String? vale) {
                                    person.email = vale!;
                                    // email = person.email;
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
                                      // password = person.password;
                                    });
                                  },
                                ),
                                const SizedBox(height: 20.0),
                                TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    filled: true,
                                    fillColor:
                                        const Color.fromRGBO(40, 40, 41, 1),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2,
                                            color:
                                                Color.fromRGBO(238, 29, 82, 1)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    prefixIcon: const Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.lock_outline,
                                        size: 20.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    labelText: 'Re-type password',
                                    labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Icon(_obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                  ),
                                  maxLength: 8,
                                  obscureText: true,
                                  validator: _validatePassword,
                                  controller: _passwordTextController,
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
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SignupPage2(
                  email: _emailTextController.text,
                  password: _passwordTextController.text)));
    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(value)));
  }
}
