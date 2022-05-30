import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

class PersonData {
  String name = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
  String address = '';
  String nric = '';
  // String dpUrl = '';
}

class UserAuth {
  String statusMsg = "Account Created Successfully";

  // To create new User
  Future<UserCredential?> createUser(PersonData userData) async {
    try {
      var _user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(_user.user!.uid)
          .set({
            'name': userData.name,
            'email': userData.email,
            'phone': userData.phoneNumber,
            'nric': userData.nric,
            'address': userData.address,
            'userType': 'member',
            'dpUrl':
                "https://firebasestorage.googleapis.com/v0/b/qidgym.appspot.com/o/avatar.png?alt=media&token=f0306a5d-b937-4eb9-8077-1fa6b07dc3de",
            // 'name': userData.name,
          })
          .then((value) => debugPrint('User Created : ${_user.user!.email}'))
          .catchError((e) => debugPrint('Database Error!'));
      return _user;
    } on FirebaseAuthException catch (e) {
      throw signUpErrorCodes[e.code] ?? 'Database Error Occured!';
    } catch (e) {
      debugPrint('${e.toString()} Error Occured!');
    }
    return null;
  }

  //To verify new User
  Future<UserCredential> verifyUser(PersonData userData) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return firebaseAuth.signInWithEmailAndPassword(
        email: userData.email, password: userData.password);
  }

  /// sign out user
  void signOut() {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.signOut();
  }

  /// sign in with google
  Future<UserCredential> signInWithGoogle() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = new GoogleSignIn();
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: "Invalid Email or Password",
        toastLength: Toast.LENGTH_LONG,
      );

      // debugPrint('${e.toString()}');
    }

    return user;
  }

  static const signUpErrorCodes = <String, String>{
    'weak-password': 'The password is too weak',
    'email-already-in-use': 'An account already exists for this email',
  };
}
