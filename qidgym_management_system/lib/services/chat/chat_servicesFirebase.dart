import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qidgym_management_system/model/chat.dart';
import 'package:qidgym_management_system/services/chat/chat_services.dart';

class ChatServiceFirebase extends ChatService {
  @override
  Stream<List<ChatModel>> readChatMessage() {
    return FirebaseFirestore.instance
        .collection('messages')
        .orderBy('time')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ChatModel.fromJson(doc.data()))
            .toList());
  }

  @override
  Future<void> addMessage() {
    String message = "";
    var now = DateTime.now();
    String? documentId = FirebaseAuth.instance.currentUser?.uid;
    return FirebaseFirestore.instance
        .collection("messages")
        .add({
          'sender': FirebaseAuth.instance.currentUser?.email,
          'text': message,
          'time': FieldValue.serverTimestamp(),
        })
        .then((value) => print("Message Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Future<void> clearMessage() async {
    var collection = FirebaseFirestore.instance.collection('messages');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }
}
