import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:qidgym_management_system/app/service_locator.dart';
import 'package:qidgym_management_system/services/profile/current_user.dart';

class UserCollection {
  final String? uid;
  UserCollection({this.uid});

  final AuthService _auth = locator<AuthService>();
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future<Map> getPersonalInfo() async {
    final uid = await _auth.getCurrentUser();
    Map<String, dynamic> users;
    var res = await _userCollection.doc(uid).get().then((ds) {
      users = {
        'name': ds['name'],
        'email': ds['email'],
        'nric': ds['nric'],
        'address': ds['address'],
        'phone': ds['phone'],
        'userType': ds['userType'],
        'dpUrl': ds['dpUrl']
      };
      return users;
    });
    return res;
  }

  Future<void> updatePersonalInfo(String name, String email, String nric,
      String address, String phone, String userType, String dpUrl) async {
    final uid = await _auth.getCurrentUser();
    await _userCollection
        .doc(uid)
        .update({
          'name': name,
          'email': email,
          'nric': nric,
          'phone': phone,
          'address': address,
          'userType': userType,
          'dpUrl': dpUrl,
        })
        .then((value) => print("User Profile Updated"))
        .catchError((error) => print("Failed to update: $error"));
  }

  Future<void> updateDp(File? imageFile) async {
    final uid = await _auth.getCurrentUser();
    String imageUrl = "";
    try {
      if (imageFile != null) {
        final ref = FirebaseStorage.instance.ref().child(imageFile.path);
        await ref.putFile(imageFile);
        imageUrl = await ref.getDownloadURL();
      }
    } catch (error) {
      print('error occured ${error}');
    }
    await _userCollection
        .doc(uid)
        .update({'dpUrl': imageUrl})
        .then((value) => print("Default Picture Updated"))
        .catchError((error) => print("Failed to update : $error"));
  }
}
