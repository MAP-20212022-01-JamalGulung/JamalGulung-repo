import "package:flutter/material.dart";
import 'package:qidgym_management_system/ui/maininterfaces.dart';

class Reset extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ResetState();
}

class ResetState extends State<Reset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(24, 24, 24, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Reset Password",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
        ),
        shape: Border(
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
            padding: EdgeInsets.only(top: 20, left: 40, right: 40),
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
                        SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Please enter your email for password reset",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(40, 40, 41, 1),

                            // contentPadding: EdgeInsets.all(0.0),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromRGBO(238, 29, 82, 1)),
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(
                                Icons.email_outlined,
                                size: 20.0,
                                color: Colors.grey,
                              ),
                            ),
                            hintText: "Enter your email",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
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
                                  builder: (context) => MainInterfaces()));
                        },
                        child: Text(
                          'SEND',
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
