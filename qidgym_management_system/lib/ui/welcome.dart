import 'package:flutter/material.dart';
import 'screens/login/register_view.dart';
import 'package:qidgym_management_system/ui/screens/login/login.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/BG3.jpg"),
            fit: BoxFit.fill,
          )),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.bottomLeft,
                  colors: [
                Color.fromRGBO(238, 29, 82, 0.5),
                Color.fromRGBO(32, 2, 10, 1),
              ],
                  stops: [
                0.0,
                1.0
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 380,
                child: FittedBox(
                  child: Image.asset("assets/QydLogo2.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Colors.white),
                              elevation: 0,
                              primary: Colors.transparent,
                              onPrimary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                          },
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Colors.white),
                              elevation: 20,
                              primary: Color.fromRGBO(255, 255, 255, 1),
                              onPrimary: Color.fromRGBO(238, 29, 82, 1),
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
