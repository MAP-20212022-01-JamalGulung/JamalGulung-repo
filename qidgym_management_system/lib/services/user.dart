import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qidgym_management_system/services/current_user.dart';

class UserCollection {
  String? name;
  String? email;
  String? nric;
  String? phone;
  String? address;
  String? dpUrl;
  late final AuthService _auth;

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future updatePersonalInfo(String name, String email, String nric,
      String phone, String address, String dpUrl) async {
    final uid = await _auth.getCurrentUser();
    await _userCollection.doc(uid).update({
      'name': name,
      'email': email,
      'nric': nric,
      'phone': phone,
      'address': address,
      'dpUrl': dpUrl,
    });
  }
}
