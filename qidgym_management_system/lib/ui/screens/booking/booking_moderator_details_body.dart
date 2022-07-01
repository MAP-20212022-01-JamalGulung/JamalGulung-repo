import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
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
  String _name = 'Khainor';
  String _email = 'khainorazam25@gmail.com';

  Future acceptedEmail(
      {required String name,
      required String email,
      required String eventName,
      required String date,
      required String slot}) async {
    const serviceID = 'service_pzkcm1g';
    const templateID = 'template_4mrke17';
    const userID = 'QY8Jz5if6vPH7YTn7';
    const accessToken = '3YX7DZ1gdv3N8bVh0NrT_';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'service_id': serviceID,
          'template_id': templateID,
          'user_id': userID,
          'accessToken': accessToken,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'event_name': eventName,
            'date': date,
            'slot': slot
          },
        },
      ),
    );

    print(response.body);
  }

  Future rejectedEmail(
      {required String name,
      required String email,
      required String eventName,
      required String date,
      required String slot}) async {
    const serviceID = 'service_pzkcm1g';
    const templateID = 'template_mtrylfe';
    const userID = 'QY8Jz5if6vPH7YTn7';
    const accessToken = '3YX7DZ1gdv3N8bVh0NrT_';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'service_id': serviceID,
          'template_id': templateID,
          'user_id': userID,
          'accessToken': accessToken,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'event_name': eventName,
            'date': date,
            'slot': slot
          },
        },
      ),
    );

    print(response.body);
  }

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
                                  _name = snapshot.data.toString();
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
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: FutureBuilder<String>(
                              future:
                                  viewmodel.getCustomerEmail(widget.post.uid),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.hasData) {
                                  _email = snapshot.data.toString();
                                  return Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Text(
                                      "Email: " + snapshot.data.toString(),
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

                                  acceptedEmail(
                                      name: _name,
                                      email: _email,
                                      eventName: widget.post.event_name,
                                      date: widget.post.date,
                                      slot: widget.post.slot);

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

                                  rejectedEmail(
                                      name: _name,
                                      email: _email,
                                      eventName: widget.post.event_name,
                                      date: widget.post.date,
                                      slot: widget.post.slot);

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
