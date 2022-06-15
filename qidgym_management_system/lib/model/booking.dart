import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  Timestamp date;
  String event_desc;
  String event_name;
  String slot;
  String status;
  String uid;

  BookingModel({
    required this.date,
    this.event_desc = "",
    this.event_name = "",
    this.slot = "",
    this.status = "",
    this.uid = "",
  });

  factory BookingModel.fromMap(map) {
    return BookingModel(
      date: map["date"],
      event_desc: map["event_desc"],
      event_name: map["event_name"],
      slot: map["slot"],
      status: map["status"],
      uid: map["uid"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "date": date,
      "event_desc": event_desc,
      "event_name": event_name,
      "slot": slot,
      "status": status,
      "uid": uid
    };
  }

  Map<String, dynamic> toJson() => {
        "date": date,
        "event_desc": event_desc,
        "event_name": event_name,
        "slot": slot,
        "status": status,
        "uid": uid
      };

  static BookingModel fromJson(Map<String, dynamic> json) => BookingModel(
        date: json['date'],
        event_desc: json['event_desc'],
        event_name: json["event_name"],
        slot: json["slot"],
        uid: json["uid"],
        status: json["status"],
      );
}
