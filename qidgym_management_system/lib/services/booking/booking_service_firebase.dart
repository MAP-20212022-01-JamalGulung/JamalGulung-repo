import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import 'package:qidgym_management_system/model/bookingDetails.dart';
import 'package:qidgym_management_system/services/booking/booking_service.dart';
import 'package:qidgym_management_system/services/profile/current_user.dart';
import 'package:qidgym_management_system/services/world_time.dart';

class BookingServiceFirebase extends BookingService {
  final AuthService _auth = locator<AuthService>();

  @override
  Stream<List<Book>> readBooking() => FirebaseFirestore.instance
      .collection('Booking')
      .where('date', isEqualTo: tomorrowDate.toString())
      .where('status', isEqualTo: 'accepted')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Book.fromJson(doc.data())).toList());

  @override
  Stream<List<Book>> readAllBooking() => FirebaseFirestore.instance
      .collection('Booking')
      .where('date', isEqualTo: tomorrowDate.toString())
      // .where('uid', isEqualTo: 'accepted')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Book.fromJson(doc.data())).toList());

  @override
  Stream<List<Book>> readPendingBooking() => FirebaseFirestore.instance
      .collection('Booking')
      .where('date', isEqualTo: tomorrowDate.toString())
      .where('status', isEqualTo: 'pending')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Book.fromJson(doc.data())).toList());

  @override
  Future rejectBooking(String bookingID) async {
    try {
      final docOrder =
          FirebaseFirestore.instance.collection("Booking").doc(bookingID);

      await docOrder.delete();
    } on Exception catch (e) {
      return 100;
    }
  }

  @override
  Future addBooking(
      String date, String eventDesc, String eventName, String slot) async {
    final uid = await _auth.getCurrentUser();
    final newBooking = FirebaseFirestore.instance.collection("Booking");
    Book bookingdetails = Book(
        date: date,
        event_desc: eventDesc,
        event_name: eventName,
        slot: slot,
        status: 'pending',
        uid: uid!);

    DocumentReference docRef = await FirebaseFirestore.instance
        .collection('Booking')
        .add(bookingdetails.toJson());

    Fluttertoast.showToast(
      msg: "Room Booked",
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
