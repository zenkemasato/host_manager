import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class BoySignUpModel extends ChangeNotifier {
  // テキストコントローラー
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // 代入する変数
  String? name;
  String? age;
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

  Future boySignUpModel() async {
    this.name = nameController.text;
    this.age = ageController.text;
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

        final doc = FirebaseFirestore.instance.collection('boys').doc(uid);

        await doc.set({
          "name": name,
          "age": age,
          "uid": uid,
          "email": email,
        });
      }
    }
  }
}
