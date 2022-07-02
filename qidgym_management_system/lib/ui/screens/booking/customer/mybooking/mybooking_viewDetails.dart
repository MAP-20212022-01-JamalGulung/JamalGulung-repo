import 'package:flutter/material.dart';
import 'package:map_mvvm/view.dart';
import 'package:qidgym_management_system/model/booking.dart';
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
    return Scaffold(
      appBar: MyBookingAppBar(),
      body: View<MyBookingViewModel>(
          builder: (_, viewmodel) => StreamBuilder<List<BookingModel>>(
                stream: viewmodel.readThisBooking(bookingID: widget.title),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return Text("Loading");
                  // }
                  if (snapshot.hasData) {
                    final _book = snapshot.data!;
                    return Container(
                      color: const Color.fromRGBO(24, 24, 24, 1),
                      child: Column(
                        children: [
                          ListView(
                            shrinkWrap: true,
                            children: _book.map((_book) {
                              return Container(
                                  // constraints: const BoxConstraints.expand(
                                  //     height: 100,
                                  //     ),
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Card(
                                          color: Color.fromRGBO(40, 40, 40, 1),
                                          child: Column(
                                            children: [
                                              const Text(
                                                ' ',
                                                style: TextStyle(
                                                  fontSize: 10.0,
                                                ),
                                              ),
                                              Text(
                                                "Event Name: " +
                                                    _book.event_name,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "Description: " +
                                                    _book.event_desc,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                              Text(
                                                "Date: " + _book.date,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                              const Text(
                                                ' ',
                                                style: TextStyle(
                                                  fontSize: 10.0,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.network(
                                                    'https://firebasestorage.googleapis.com/v0/b/qidgym.appspot.com/o/Untitled%20design.png?alt=media&token=3aaf0cf7-4b9b-49fa-adef-cf6755317ef6'),
                                              ),
                                              Text(
                                                "Status: " + _book.status,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(7.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center, //Center Column contents vertically,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center, //Center Column contents horizontally,
                                                    children: [
                                                      MaterialButton(
                                                        color: const Color
                                                                .fromRGBO(
                                                            238, 29, 82, 1),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.0),
                                                        ),
                                                        onPressed: () {
                                                          // showAlertDialog(context);
                                                        },
                                                        child: const Text(
                                                          "Generate PDF",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: 5,
                                                          height: 0,
                                                          child: Container(
                                                              color: Colors
                                                                  .transparent)),
                                                      MaterialButton(
                                                        color: const Color
                                                                .fromRGBO(
                                                            84, 84, 84, 1),
                                                        // color: Colors.blue,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.0),
                                                        ),
                                                        onPressed: () {},
                                                        child: const Text(
                                                          "Cancel",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              )),
    );
  }
}
