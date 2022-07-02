import 'package:flutter/material.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/booking.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/bookingform/bookingform.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/bookingform/bookingform_screen.dart';
import 'booking_moderator_appbar.dart';
import 'booking_moderator_body.dart';

class BookingModeratorScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => BookingModeratorScreen());

  @override
  BookingModeratorScreenState createState() => BookingModeratorScreenState();
}

class BookingModeratorScreenState extends State<BookingModeratorScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const BookingModeratorAppBar(),
        body: BookingModeratorBody(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BookingBody()));
          },
          label: const Text('Add New Booking'),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}
