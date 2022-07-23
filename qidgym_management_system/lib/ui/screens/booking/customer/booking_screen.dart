import "package:flutter/material.dart";
import 'package:qidgym_management_system/ui/screens/booking/customer/booking_pdf.dart';

import 'booking.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(24, 24, 24, 1),
        appBar: BookingAppBar(),
        body: BookingBody(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.of(context).push(
        //       MaterialPageRoute(
        //         builder: (context) => bookingPdf(),
        //       ),
        //     );
        //   },
        //   child: Icon(Icons.picture_as_pdf),
        //   backgroundColor: Color.fromRGBO(238, 29, 82, 1),
        // ),
      ),
    );
  }
}
