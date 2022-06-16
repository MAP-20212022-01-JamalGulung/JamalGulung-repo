import 'package:flutter/material.dart';
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
      ),
    );
  }
}
