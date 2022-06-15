import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/booking.dart';

abstract class BookingModeratorService {
  Stream<List<BookingModel>> readBookingList();

  // Future deleteWashingMachine(String wmid);
}

class BookingModeratorServiceMock extends BookingModeratorService {
  @override
  Stream<List<BookingModel>> readBookingList() => FirebaseFirestore.instance
      .collection('Booking')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => BookingModel.fromJson(doc.data()))
          .toList());
}
