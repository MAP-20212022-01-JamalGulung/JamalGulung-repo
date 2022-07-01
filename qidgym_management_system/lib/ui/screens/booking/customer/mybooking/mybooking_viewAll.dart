import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:map_mvvm/view.dart';
import 'package:qidgym_management_system/model/booking.dart';
import 'package:qidgym_management_system/model/bookingDetails.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/mybooking/mybooking_viewDetails.dart';
// import 'package:qidgym_management_system/ui/screens/booking/customer/booking_viewmodel.dart';

import 'mybooking_viewmodel.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyBookingViewAll extends StatefulWidget {
  const MyBookingViewAll({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyBookingViewAll createState() => _MyBookingViewAll();
}

class _MyBookingViewAll extends State<MyBookingViewAll> {
  String? bID;
  @override
  Widget build(BuildContext context) {
    return View<MyBookingViewModel>(
        builder: (_, viewmodel) => StreamBuilder<List<BookingModel>>(
              stream: viewmodel.readAllBooking(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return Text("Loading");
                // }
                if (snapshot.hasData) {
                  final _book = snapshot.data!;
                  return Column(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        children: _book.map(buildBookList).toList(),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ));
  }

  @override
  Widget buildBookList(BookingModel book) => ListView(
          // physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            Column(children: [
              Container(
                width: double.infinity,
                height: 60,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(40, 40, 40, 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              book.event_name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // There was a logic error here in your code, so changed it to work correctly
                                        bID = book.uid;
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyBookingViewDetails(
                                                    title: bID.toString(),
                                                  )));
                                    },
                                    child: const Icon(
                                      Icons.more_vert,
                                      color: Color.fromRGBO(238, 29, 82, 1),
                                    )),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // There was a logic error here in your code, so changed it to work correctly
                                        bID = book.bookingID;
                                      });
                                      showAlertDialog(context);
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Color.fromRGBO(238, 29, 82, 1),
                                    )),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ]),
              ),
              SizedBox(
                height: 8,
              ),
            ])
          ]);

  @override
  showAlertDialog(BuildContext context) {
    // Book book;
    // set up the buttons
    // Widget cancelButton = FlatButton(
    //   child: Text("Cancel"),
    //   onPressed: () {
    //     Navigator.of(context, rootNavigator: true).pop();
    //   },
    // );
    // Widget continueButton =
    // set up the AlertDialog
    // AlertDialog alert = AlertDialog(
    //   title: Text("Confirm Cancellation"),
    //   content: Text("Are you sure to cancel your booking?"),
    //   actions: [],
    // );
    // // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return View<MyBookingViewModel>(
            builder: (_, viewmodel) => AlertDialog(
                  title: Text("Confirm Cancellation"),
                  content: Text("Are you sure to cancel your booking?"),
                  actions: [
                    FlatButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                    ),
                    FlatButton(
                      child: Text("Confirm " + bID.toString()),
                      onPressed: () {
                        // Navigator.of(context, rootNavigator: true).pop();
                        viewmodel.deleteBooking(bookingID: bID.toString());
                        setState(() {});
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                    ),
                  ],
                ));
      },
    );
  }
}
