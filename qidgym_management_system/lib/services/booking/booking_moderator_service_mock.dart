import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import 'package:qidgym_management_system/model/bookingDetails.dart';
import 'package:qidgym_management_system/services/booking/booking_moderator_service.dart';

import '../../model/booking.dart';
import '../profile/current_user.dart';

class BookingModeratorServiceMock extends BookingModeratorService {
  final AuthService _auth = locator<AuthService>();
  // String? uid = '';
  // late String uid = _auth.getCurrentUser();

  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Stream<List<BookingModel>> readBookingList() {
    return FirebaseFirestore.instance
        .collection('Booking')
        .where('status', isEqualTo: "pending")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => BookingModel.fromJson(doc.data()))
            .toList());
  }

  @override
  Stream<List<BookingModel>> readAllBooking() => FirebaseFirestore.instance
      .collection('Booking')
      .where('uid', isEqualTo: user!.uid)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => BookingModel.fromJson(doc.data()))
          .toList());

  @override
  Stream<List<BookingModel>> readThisBooking(String bookingID) =>
      FirebaseFirestore.instance
          .collection('Booking')
          .where('bookingID', isEqualTo: bookingID)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => BookingModel.fromJson(doc.data()))
              .toList());

  @override
  Future acceptBooking(String bookingID) async {
    try {
      final docOrder =
          FirebaseFirestore.instance.collection("Booking").doc(bookingID);

      await docOrder.update({'status': "accepted"});
    } on Exception catch (e) {
      return 100;
    }
  }

  @override
  Future rejectBooking(String bookingID) async {
    try {
      final docOrder =
          FirebaseFirestore.instance.collection("Booking").doc(bookingID);

      await docOrder.update({'status': "rejected"});
    } on Exception catch (e) {
      return 100;
    }
  }

  @override
  Future<String> getCustomerName(String uid) async {
    String name;

    return FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .get()
        .then((value) {
      Map data = value.data() as Map;
      name = data['name'].toString();
      return name;
    });
  }

  @override
  Stream<List<BookingModel>> readPendingBooking() => FirebaseFirestore.instance
      .collection('Booking')
      // .where('date', isEqualTo: tomorrowDate.toString())
      .where('status', isEqualTo: 'pending')
      // .where(FieldPath.documentId, isEqualTo: uid)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => BookingModel.fromJson(doc.data()))
          .toList());

  @override
  Future deleteBooking(String bookingID) async {
    try {
      var collection = FirebaseFirestore.instance.collection('Booking');
      var snapshot =
          await collection.where('bookingID', isEqualTo: bookingID).get();
      await snapshot.docs.first.reference.delete();
      Fluttertoast.showToast(
          msg: "Booking Cancelled",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 255, 17, 0),
          textColor: Colors.white,
          fontSize: 16.0);
    } on Exception catch (e) {
      return 0;
    }
  }

  Future<String> getCustomerEmail(String uid) async {
    String email;

    return FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .get()
        .then((value) {
      Map data = value.data() as Map;
      email = data['email'].toString();
      return email;
    });
  }
}
