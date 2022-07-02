import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String sender;
  String time;
  String text;

  ChatModel({
    this.sender = "",
    this.time = "",
    this.text = "",
  });

  factory ChatModel.fromMap(map) {
    return ChatModel(
      sender: map["sender"],
      time: map["time"],
      text: map["text"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "sender": sender,
      "time": time,
      "text": text,
    };
  }

  Map<String, dynamic> toJson() => {
        "sender": sender,
        "time": time,
        "text": text,
      };

  static ChatModel fromJson(Map<String, dynamic> json) => ChatModel(
        sender: json["sender"],
        time: json["time"],
        text: json["text"],
      );
}
