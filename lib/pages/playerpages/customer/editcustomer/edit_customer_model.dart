// ignore_for_file: non_constant_identifier_names, unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/domein/costomer.dart';

class EditCustomerModel extends ChangeNotifier {
  // EditCustomerから引数をもらう
  final Customer customer;

  // EditCustomerにそれぞれの要素を格納
  EditCustomerModel(this.customer) {
    namecontroller.text = customer.name;
    agecontroller.text = customer.age;
    birthdaycontroller.text = customer.birthday;
    hobbycontroller.text = customer.hobby;
    countcontroller.text = customer.count;
    numbercontroller.text = customer.number;
    ngwordcontroller.text = customer.ngword;
  }

  // 更新されたかを判別する関数
  bool isUpdated() {
    return name != null ||
        age != null ||
        birthday != null ||
        hobby != null ||
        count != null ||
        number != null ||
        ngword != null;
  }

  //  値の更新を受け取る
  void setName(String name) {
    this.name = name;
    notifyListeners();
  }

  void setAge(String age) {
    this.age = age;
    notifyListeners();
  }

  void setBirthDay(String birthday) {
    this.birthday = birthday;
    notifyListeners();
  }

  void setHobby(String hobby) {
    this.hobby = hobby;
    notifyListeners();
  }

  void setCount(String count) {
    this.count = count;
    notifyListeners();
  }

  void setNumber(String number) {
    this.number = number;
    notifyListeners();
  }

  void setNgword(String ngword) {
    this.ngword = ngword;
    notifyListeners();
  }

  // Edit用controller
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final birthdaycontroller = TextEditingController();
  final hobbycontroller = TextEditingController();
  final countcontroller = TextEditingController();
  final numbercontroller = TextEditingController();
  final ngwordcontroller = TextEditingController();

  String? name;
  String? age;
  String? birthday;
  String? hobby;
  String? count;
  String? number;
  String? ngword;

  Future editCustomerModel() async {
    // nullチェックを入れる
    this.name = namecontroller.text;
    this.age = agecontroller.text;
    this.birthday = birthdaycontroller.text;
    this.hobby = hobbycontroller.text;
    this.count = countcontroller.text;
    this.number = numbercontroller.text;
    this.ngword = ngwordcontroller.text;

    // firestoreに追加
    await FirebaseFirestore.instance
        .collection('users')
        .doc(customer.id)
        .update({
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
