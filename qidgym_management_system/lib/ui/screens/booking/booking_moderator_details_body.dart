import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../model/booking.dart';
import 'booking_moderator_screen.dart';
import 'booking_moderator_viewmodel.dart';

class BookingModeratorDetailsBody extends StatefulWidget {
  final BookingModel post;

  BookingModeratorDetailsBody({required this.post});

  @override
  BookingModeratorDetailsBodyState createState() =>
      BookingModeratorDetailsBodyState();
}

class BookingModeratorDetailsBodyState
    extends State<BookingModeratorDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return View<BookingModeratorViewModel>(
        shouldRebuild: false,
        builder: (_, viewmodel) => Scaffold(
              appBar: AppBar(
                title: Text('Booking List'),
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookingModeratorScreen()));
                  },
                  icon: Icon(Icons.chevron_left_sharp),
                  iconSize: 40.0,
                ),
                centerTitle: true,
                backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
                foregroundColor: Colors.grey,
                actions: <Widget>[],
              ),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(24, 24, 24, 1),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: ListTile(
                          title: Text(
                            "Booking ID: " + widget.post.bookingID,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: ListTile(
                          title: Text(
                            "Customer Details",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: FutureBuilder<String>(
                              future:
                                  viewmodel.getCustomerName(widget.post.uid),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Text(
                                      "Name: " + snapshot.data.toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    ),
                                  );
                                } else {
                                  return const Text('No data is found!');
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      // Row(
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 40.0),
                      //       child: FutureBuilder<String>(
                      //         future: viewmodel
                      //             .getCustomerPhoneNum(widget.post.userId),
                      //         builder: (BuildContext context, snapshot) {
                      //           if (snapshot.hasData) {
                      //             return Padding(
                      //               padding: const EdgeInsets.all(0),
                      //               child: Text(
                      //                 "Phone Number: " +
                      //                     snapshot.data.toString(),
                      //                 style: const TextStyle(fontSize: 17),
                      //               ),
                      //             );
                      //           } else {
                      //             return const Text('No data is found!');
                      //           }
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 12.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: ListTile(
                          title: Text(
                            "Booking Details",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text("Event Name: " + widget.post.event_name,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                                "Event Description: " + widget.post.event_desc,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text("Order Slot: " + widget.post.slot,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text("Order Date: " + widget.post.date,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 13.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 10, left: 90, bottom: 20),
                            child: FloatingActionButton.extended(
                              heroTag: "accept",
                              onPressed: () async {
                                dynamic msg = await viewmodel.acceptBooking(
                                    bookingID: widget.post.bookingID);

                                if (msg == 100) {
                                  Fluttertoast.showToast(
                                    msg: "Error! Unable to accept order.",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    fontSize: 16,
                                    backgroundColor:
                                        const Color.fromARGB(255, 209, 68, 58),
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "The booking is accepted!",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    fontSize: 16,
                                    backgroundColor:
                                        const Color.fromARGB(255, 69, 161, 76),
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BookingModeratorScreen()));
                                }
                              },
                              label: const Text('Accept',
                                  // ignore: unnecessary_const
                                  style: const TextStyle(fontSize: 17)),
                              highlightElevation: 10.0,
                              backgroundColor: Color.fromARGB(255, 8, 212, 110),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 30, left: 10, bottom: 20),
                            child: FloatingActionButton.extended(
                              heroTag: "reject",
                              onPressed: () async {
                                dynamic msg = await viewmodel.rejectBooking(
                                    bookingID: widget.post.bookingID);

                                if (msg == 100) {
                                  Fluttertoast.showToast(
                                    msg: "Error! Unable to reject order.",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    fontSize: 16,
                                    backgroundColor:
                                        const Color.fromARGB(255, 209, 68, 58),
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "The booking is rejected!",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    fontSize: 16,
                                    backgroundColor:
                                        const Color.fromARGB(255, 69, 161, 76),
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BookingModeratorScreen()));
                                }
                              },
                              label: const Text('Reject',
                                  // ignore: unnecessary_const
                                  style: const TextStyle(fontSize: 17)),
                              highlightElevation: 10.0,
                              backgroundColor:
                                  Color.fromARGB(255, 232, 103, 86),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
