import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNewCustomerModel extends ChangeNotifier {
  // firebaseAuthからそれぞれのデータをとる
  final admin = FirebaseAuth.instance.currentUser;

  String? name;
  String? age;
  String? birthday;
  String? hobby;
  String? count;
  String? number;
  String? ngword;

  Future addCustomerModel() async {
    // nullチェックを入れる
    if (name == null || name!.isEmpty) {
      throw "名前が入力されていません";
    }
    if (age == null || age!.isEmpty) {
      throw "年齢が入力されていません";
    }
    if (birthday == null || birthday!.isEmpty) {
      throw "誕生日が入力されていません";
    }
    if (hobby == null || hobby!.isEmpty) {
      throw "趣味が入力されていません";
    }
    if (count == null || count!.isEmpty) {
      throw "来店回数が入力されていません";
    }
    if (number == null || number!.isEmpty) {
      throw "電話番号が入力されていません";
    }
    if (ngword == null || ngword!.isEmpty) {
      throw "NGワードが入力されていません";
    }

    // firestoreに追加
    await FirebaseFirestore.instance
        .collection('admins')
        .doc(admin!.uid)
        .collection("newcustomers")
        .add({
      "name": name,
      "age": age,
      "birthday": birthday,
      "hobby": hobby,
      "count": count,
      "number": number,
      "ngword": ngword,
    });
  }
}
