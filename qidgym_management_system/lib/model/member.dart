import 'package:cloud_firestore/cloud_firestore.dart';

class MemberModel {
  String userID;
  String email;
  String expDate;
  String subsDate;
  String name;
  int period;
  String status;

  MemberModel({
    this.userID = "",
    this.email = "",
    this.expDate = "",
    this.subsDate = "",
    this.name = "",
    this.period = 0,
    this.status = "",
  });

  factory MemberModel.fromMap(map) {
    return MemberModel(
      userID: map["userID"],
      email: map["email"],
      expDate: map["expDate"],
      subsDate: map["subsDate"],
      name: map["name"],
      period: map["period"],
      status: map["status"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "userID": userID,
      "email": email,
      "expDate": expDate,
      "subsDate": subsDate,
      "name": name,
      "period": period,
      "status": status
    };
  }

  Map<String, dynamic> toJson() => {
        "userID": userID,
        "email": email,
        "expDate": expDate,
        "subsDate": subsDate,
        "name": name,
        "period": period,
        "status": status
      };

  static MemberModel fromJson(Map<String, dynamic> json) => MemberModel(
        userID: json['userID'],
        email: json['email'],
        expDate: json["expDate"],
        subsDate: json["subsDate"],
        name: json["name"],
        period: json["period"],
        status: json["status"],
      );
}
