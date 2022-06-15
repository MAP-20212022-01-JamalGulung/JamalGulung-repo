import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:qidgym_management_system/ui/screens/booking/customer/bookingform/bookingform.dart';

class BookingForm extends StatefulWidget {
  final String slot;
  const BookingForm({Key? key, required this.slot}) : super(key: key);

  @override
  State<BookingForm> createState() => _BookingFormState(slot: this.slot);
}

class _BookingFormState extends State<BookingForm> {
  String slot;
  _BookingFormState({required this.slot});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromRGBO(24, 24, 24, 1),
          appBar: BookingFormAppBar(),
          body: BookingFormBody(
            slot: slot,
          )),
    );
  }
}
