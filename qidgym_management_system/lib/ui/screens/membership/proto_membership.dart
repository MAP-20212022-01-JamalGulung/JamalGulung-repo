// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class Membership extends StatefulWidget {
  Membership({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _Membership createState() => _Membership();
}

class _Membership extends State<Membership> {
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Membership",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
          ),
          shape: const Border(
              bottom: BorderSide(
            color: Colors.grey,
            width: 1,
            style: BorderStyle.solid,
          )),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /// Basic Toggle Sample
      
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * .28,
                  color: const Color.fromRGBO(84, 84, 84, 1),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                  // alignment: Alignment.bottomRight,
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  child: Text(
                                    'MONTHLY MEMBER',
                                    // textAlign: TextAlign.right,
                                    style: GoogleFonts.oswald(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Container(
                              width: 400,
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Container(
                                    width: 255,
                                    height: 30,
                                    color: const Color.fromRGBO(192, 52, 45, 1),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'MOHD IDHAM BIN ANUR',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 5,
                                    height: 30,
                                    color: Colors.transparent,
                                  ),
                                  Container(
                                    width: 110,
                                    height: 30,
                                    color: Colors.white,
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'QZ 8503',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'EXPIRY DATE: ',
                                style: GoogleFonts.oswald(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyText2,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                '26-JULY-2021',
                                style: GoogleFonts.oswald(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyText2,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/barcode.png',
                                height: 60.0,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  // alignment: Alignment.bottomRight,
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 0, 0),
                                  child: Text(
                                    'PLEASE SHOW THIS CARD UPON ENTRANCE',
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.oswald(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  )),
                              SizedBox(
                                  width: 15,
                                  height: 0,
                                  child: Container(color: Colors.transparent)),
                              Image.asset(
                                'assets/QydLogoGrey2.png',
                                height: 50.0,
                                fit: BoxFit.cover,
                                // alignment: Alignment.bottomRight,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: const Color.fromRGBO(238, 29, 82, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "RENEW",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                    width: 5,
                    height: 0,
                    child: Container(color: Colors.transparent)),
                MaterialButton(
                  color: const Color.fromRGBO(84, 84, 84, 1),
                  // color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "TERMINATE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
           
            const Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
