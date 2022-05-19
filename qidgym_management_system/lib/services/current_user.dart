import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<String?> getCurrentUser() async {
    String? documentId = FirebaseAuth.instance.currentUser?.uid;
    return documentId;
  }
}
