import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

mixin RegisterController on Model {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> registerCreateUsre({
    required String email,
    required String password,
    required String rool,
    required BuildContext context,
  }) async {
    User? user;

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      user = userCredential.user;
      notifyListeners();

      await postDetailsToFirestore(email, rool);
    } on FirebaseAuthException catch (e) {}
    notifyListeners();
    return user;
  }

  bool checkEmailValidate(String email) {
    bool isEmailValid = EmailValidator.validate(email.trim());
    notifyListeners();
    return isEmailValid;
  }

  Future<void> postDetailsToFirestore(String email, String rool) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({'email': email, 'rool': rool});
  }
}
