// ignore_for_file: unused_field, non_constant_identifier_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/domein/costomer.dart';

class PlayerCustomerModel extends ChangeNotifier {
  List<Customer>? Customers;

  // firebaseから値を読み取り、snapshotに格納
  void fechCustomerList() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();
    // snapshot型のデータをMap型に変え、Customersに代入
    final List<Customer> Customers =
        snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String name = data["name"];
      final String age = data["age"];
      final String birthday = data["birthday"];
      final String hobby = data["hobby"];
      final String count = data["count"];
      final String number = data["number"];
      final String ngword = data["ngword"];
      // 取得した値をCustomerモデルに代入
      return Customer(id, name, age, birthday, hobby, count, number, ngword);
    }).toList();
    // それぞれの値を初期化されたCustomerに代入
    this.Customers = Customers;
    notifyListeners();
  }
}
