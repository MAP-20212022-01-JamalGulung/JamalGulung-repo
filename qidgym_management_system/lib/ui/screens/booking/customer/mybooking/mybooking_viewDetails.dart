import 'package:flutter/material.dart';
import 'package:map_mvvm/view.dart';
import 'package:qidgym_management_system/model/bookingDetails.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/booking_viewmodel.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/mybooking/mybooking_app_bar.dart';

import 'mybooking_viewmodel.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyBookingViewDetails extends StatefulWidget {
  MyBookingViewDetails({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  _MyBookingViewDetails createState() => _MyBookingViewDetails();
}

class _MyBookingViewDetails extends State<MyBookingViewDetails> {
  @override
  Widget build(BuildContext context) {
    // AppBar: o;
    return Scaffold(
      appBar: MyBookingAppBar(),
      body: Container(
          constraints: const BoxConstraints.expand(
              // height: 100%,
              ),
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(238, 29, 82, 1),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                Card(
                  color: Colors.grey,
                  child: Column(
                    children: [
                      const Text(
                        ' ',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                      Text(
                        'Test',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        ' ',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                      Image.network(
                          'https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg'),
                      Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, //Center Column contents vertically,
                            crossAxisAlignment: CrossAxisAlignment
                                .center, //Center Column contents horizontally,
                            children: [
                              MaterialButton(
                                color: const Color.fromRGBO(238, 29, 82, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                onPressed: () {
                                  // showAlertDialog(context);
                                },
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
                          ))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
