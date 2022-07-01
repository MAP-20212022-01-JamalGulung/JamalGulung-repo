import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import 'package:qidgym_management_system/model/booking.dart';
import 'package:qidgym_management_system/model/bookingDetails.dart';
import 'package:qidgym_management_system/services/booking/booking_service.dart';
import 'package:qidgym_management_system/services/profile/current_user.dart';
import 'package:qidgym_management_system/services/world_time.dart';

class BookingServiceFirebase extends BookingService {
  final AuthService _auth = locator<AuthService>();
  String? docID2 = "";
  // String? uid = '';
  // late String uid = _auth.getCurrentUser();

  final User? user = FirebaseAuth.instance.currentUser;
  // here you write the codes to input the data into firestore

  @override
  Stream<List<Book>> readBooking() => FirebaseFirestore.instance
      .collection('Booking')
      .where('date', isEqualTo: tomorrowDate.toString())
      .where('status', isEqualTo: 'accepted')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Book.fromJson(doc.data())).toList());

  Future<String> get_data(DocumentReference doc_ref) async {
    DocumentSnapshot docSnap = await doc_ref.get();
    final docID2 = docSnap.reference.id;
    return docID2.toString();
  }

//To retrieve the string

  // @override
  // Stream<List<Book>> readAllBooking() => FirebaseFirestore.instance
  //     .collection('Booking')
  //     .where('uid', isEqualTo: user!.uid)
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((doc) => Book.fromJson(doc.data())).toList());

  // @override
  // Stream<List<Book>> readPendingBooking() => FirebaseFirestore.instance
  //     .collection('Booking')
  //     // .where('date', isEqualTo: tomorrowDate.toString())
  //     .where('status', isEqualTo: 'pending')
  //     // .where(FieldPath.documentId, isEqualTo: uid)
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((doc) => Book.fromJson(doc.data())).toList());

  // @override
  // Future deleteBooking(String bookingID) async {
  //   try {
  //     FirebaseFirestore.instance.collection("Booking").doc(bookingID).delete();
  //   } on Exception catch (e) {
  //     return 0;
  //   }
  // }
  // @override

  @override
  Future addBooking(
      String date, String eventDesc, String eventName, String slot) async {
    final uid = await _auth.getCurrentUser();
    // final bid = FieldPath.documentId;
    final ref = FirebaseFirestore.instance.collection('Booking').doc();
    final newBooking = FirebaseFirestore.instance.collection("Booking");
    BookingModel bookingdetails = BookingModel(
        bookingID: ref.id,
        date: date,
        event_desc: eventDesc,
        event_name: eventName,
        slot: slot,
        status: 'pending',
        uid: uid!);

    DocumentReference docRef = await FirebaseFirestore.instance
        .collection('Booking')
        .add(bookingdetails.toJson());

    //     DocumentReference docRef2 =  await FirebaseFirestore.instance
    // final docID2 = docSnap.reference.id;
    // return docID2.toString();

    Fluttertoast.showToast(
        msg: "Room Booked",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 255, 17, 0),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
