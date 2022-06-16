import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qidgym_management_system/services/booking/booking_moderator_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/booking.dart';

class BookingModeratorServiceMock extends BookingModeratorService {
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
}
