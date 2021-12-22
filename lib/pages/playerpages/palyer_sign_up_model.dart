import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PlayerSignUpModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? email;
  String? password;

  bool isLoading = false;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  Future playerSignUpModel() async {
    this.email = emailController.text;
    this.password = passwordController.text;

    // fire-authの認証の追加
    if (email != null && password != null) {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      final user = userCredential.user;
      if (user != null) {
        final uid = user.uid;
        // firestoreに追加

        final doc = FirebaseFirestore.instance.collection('players').doc(uid);

        await doc.set({
          "uid": uid,
          "email": email,
        });
      }
    }
  }
}
