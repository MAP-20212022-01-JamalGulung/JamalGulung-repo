// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:qidgym_management_system/services/current_user.dart';

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

  Future<void> updatePersonalInfo(String name, String email, String nric,
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
// class UserCollection {
//   final String? uid;
//   final AuthService _auth;
//   String? name;
//   String? email;
//   String? nric;
//   String? phone;
//   String? address;
//   String? dpUrl;

//   UserCollection(this._auth, {this.uid});

//   //collection reference
//   final CollectionReference _userCollection =
//       FirebaseFirestore.instance.collection('Users');

// //update personal information
//   Future<void> updatePersonalInfo(String name, String email, String nric,
//       String phone, String address, String dpUrl) async {
//     final uid = await _auth.getCurrentUser();
//     await _userCollection.doc(uid).update({
//       'name': name,
//       'email': email,
//       'nric': nric,
//       'phone': phone,
//       'address': address,
//       'dpUrl': dpUrl,
//     });
//   }

//   Future<Map> getData() async {
//     final uid = await _auth.getCurrentUser();
//     var userData;
//     var res = await _userCollection.doc(uid).get().then((ds) {
//       userData = {
//         name: ds['name'],
//         email: ds['email'],
//         nric: ds['nric'],
//         phone: ds['phone'],
//         address: ds['address'],
//         dpUrl: ds['dpUrl'],
//       };
//       return userData;
//     });
//     return res;
//   }

//   Future<Set> getName() async {
//     final uid = await _auth.getCurrentUser();
//     // var Name;
//     var res = await _userCollection.doc(uid).get().then((ds) {
//       // Name = {'name': ds['name']};
//       return {ds['name']};
//     });
//     return res;
//   }

//   Future<Set> getEmail() async {
//     final uid = await _auth.getCurrentUser();
//     // var Name;
//     var res = await _userCollection.doc(uid).get().then((ds) {
//       // Name = {'name': ds['name']};
//       return {ds['email']};
//     });
//     return res;
//   }

//   Future<Set> getNric() async {
//     final uid = await _auth.getCurrentUser();
//     // var Name;
//     var res = await _userCollection.doc(uid).get().then((ds) {
//       // Name = {'name': ds['name']};
//       return {ds['nric']};
//     });
//     return res;
//   }

//   Future<Set> getPhone() async {
//     final uid = await _auth.getCurrentUser();
//     // var Name;
//     var res = await _userCollection.doc(uid).get().then((ds) {
//       // Name = {'name': ds['name']};
//       return {ds['phone']};
//     });
//     return res;
//   }

//   Future<Set> getAddress() async {
//     final uid = await _auth.getCurrentUser();
//     // var Name;
//     var res = await _userCollection.doc(uid).get().then((ds) {
//       // Name = {'name': ds['name']};
//       return {ds['address']};
//     });
//     return res;
//   }

//   Future<Set> getDpUrl() async {
//     final uid = await _auth.getCurrentUser();
//     // var Name;
//     var res = await _userCollection.doc(uid).get().then((ds) {
//       // Name = {'name': ds['name']};
//       return {ds['dpUrl']};
//     });
//     return res;
//   }
// }

