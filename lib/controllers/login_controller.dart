import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasy_elrokn/screens/admin/admin_division_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/division_one_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

mixin LoginController on Model {
  bool _userNotFound = false;
  bool get userNotFound => _userNotFound;
  bool _wrongPassword = false;
  bool get wrongPassword => _wrongPassword;
  bool _isEmailLoading = true;
  bool get isEmailLoading => _isEmailLoading;

  Future<User?> loginEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
    required formKey,
  }) async {
    _isEmailLoading = true;
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        );
        user = userCredential.user;

        _isEmailLoading = false;
        notifyListeners();
        _userNotFound = false;
        _wrongPassword = false;
        notifyListeners();
        route(context);
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          _userNotFound = true;
          notifyListeners();

          _isEmailLoading = false;
          notifyListeners();
        } else if (e.code == 'wrong-password') {
          _isEmailLoading = false;
          _wrongPassword = true;
          notifyListeners();
        }
      }
      notifyListeners();
      return user;
    }
  }

  void route(context) {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "user") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DivisionOneScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AdminDivisionOneScreen(),
            ),
          );
        }
      } else {
        null;
      }
    });
  }
}
