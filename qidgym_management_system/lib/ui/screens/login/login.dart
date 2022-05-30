import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:qidgym_management_system/ui/maininterfaces.dart';
import 'package:qidgym_management_system/ui/screens/reset/reset.dart';
import '../../../model/PersonData.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  // final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  // bool _isProcessing = false;

  // Future<FirebaseApp> _initializeFirebase() async {
  //   FirebaseApp firebaseApp = await Firebase.initializeApp();

  //   User? user = FirebaseAuth.instance.currentUser;

  //   if (user != null) {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => MainInterfaces(
  //           user: user,
  //         ),
  //       ),
  //     );
  //   }

  //   return firebaseApp;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Login",
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
        ),
        shape: const Border(
            bottom: BorderSide(
          color: Colors.grey,
          width: 1,
          style: BorderStyle.solid,
        )),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 220,
                    height: 220,
                    child: FittedBox(
                      child: Image.asset("assets/QydLogoGrey.png"),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Email ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          validator: (emailValue) {
                            if (emailValue == null) {
                              return null;
                            }
                            if (emailValue.isEmpty) {
                              return 'Email can\'t be empty';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                          controller: _emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(40, 40, 41, 1),

                            // contentPadding: EdgeInsets.all(0.0),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2,
                                    color: const Color.fromRGBO(238, 29, 82, 1)),
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: const Icon(
                                Icons.email_outlined,
                                size: 20.0,
                                color: Colors.grey,
                              ),
                            ),
                            hintText: "Enter your email",
                            hintStyle:
                                const TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          "Password",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          validator: (passwordValue) {
                            if (passwordValue == null) {
                              return null;
                            }
                            if (passwordValue.isEmpty) {
                              return 'Password can\'t be empty';
                            }
                            return null;
                          },
                          controller: _passwordTextController,
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(40, 40, 41, 1),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2,
                                    color: Color.fromRGBO(238, 29, 82, 1)),
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(
                                Icons.lock_outline,
                                size: 20.0,
                                color: Colors.grey,
                              ),
                            ),
                            hintText: "Enter your password",
                            hintStyle:
                                const TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Reset()));
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: const TextStyle(
                                    color: Color.fromRGBO(238, 29, 82, 1),
                                    fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: const Color.fromRGBO(238, 29, 82, 1),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed:
                          (_emailTextController.text==""||_passwordTextController.text=="")?null:(
                             () async {User? user =
                              await UserAuth().signInUsingEmailPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text,
                          );

                          if(user!=null){

                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>
                                    MainInterfaces(user: user),
                              ),
                            );
                          }
                            
                          }
                          ),
                          
                        
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        )),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
