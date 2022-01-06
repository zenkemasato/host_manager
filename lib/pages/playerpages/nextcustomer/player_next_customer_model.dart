// ignore_for_file: unused_field, non_constant_identifier_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/domein/next_customer.dart';

class PlayerNextCustomerModel extends ChangeNotifier {
  List<NextCustomer>? NextCustomers;

  // firebaseAuthからそれぞれのデータをとる
  final player = FirebaseAuth.instance.currentUser;

  // firebaseから値を読み取り、snapshotに格納
  void fechCustomerList() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('players')
        .doc(player!.uid)
        .collection('nextcustomers')
        .get();
    // snapshot型のデータをMap型に変え、Customersに代入
    final List<NextCustomer> NextCustomers =
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
      return NextCustomer(
          id, name, age, birthday, hobby, count, number, ngword);
    }).toList();
    // それぞれの値を初期化されたCustomerに代入
    this.NextCustomers = NextCustomers;
    notifyListeners();
  }

  Future deleteCustomer(NextCustomer NextCustomers) {
    return FirebaseFirestore.instance
        .collection('players')
        .doc(player!.uid)
        .collection("nextcustomers")
        .doc(NextCustomers.id)
        .delete();
  }

  Future shareCustomerModel(NextCustomer NextCustomers) async {
    final String name = NextCustomers.name;
    final String ngword = NextCustomers.ngword;
    // firestoreに追加
    await FirebaseFirestore.instance.collection("ngwords").add({
      "name": name,
      "ngword": ngword,
    });
    notifyListeners();
  }

  Future addCustomer(NextCustomer NextCustomers) async {
    final String name = NextCustomers.name;
    final String age = NextCustomers.age;
    final String birthday = NextCustomers.birthday;
    final String hobby = NextCustomers.hobby;
    final String count = NextCustomers.count;
    final String number = NextCustomers.number;
    final String ngword = NextCustomers.ngword;
    // firestoreに追加
    await FirebaseFirestore.instance
        .collection("players")
        .doc("BzIeHu2FWnh05hvBF37DXbRDf0m2")
        .collection("customers")
        .add({
      "name": name,
      "age": age,
      "birthday": birthday,
      "hobby": hobby,
      "count": count,
      "number": number,
      "ngword": ngword,
    });
    notifyListeners();
  }
}
