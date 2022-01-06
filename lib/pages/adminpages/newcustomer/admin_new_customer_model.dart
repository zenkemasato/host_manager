// ignore_for_file: non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:host_manager/domein/new_customer.dart';

class AdminNewCustomerModel extends ChangeNotifier {
  List<NewCustomer>? NewCustomers;

  // firebaseAuthからそれぞれのデータをとる
  final admin = FirebaseAuth.instance.currentUser;

  // firebaseから値を読み取り、snapshotに格納
  void fechCustomerList() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('admins')
        .doc(admin!.uid)
        .collection('newcustomers')
        .get();
    // snapshot型のデータをMap型に変え、Customersに代入
    final List<NewCustomer> NewCustomers =
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
      return NewCustomer(id, name, age, birthday, hobby, count, number, ngword);
    }).toList();
    // それぞれの値を初期化されたCustomerに代入
    this.NewCustomers = NewCustomers;
    notifyListeners();
  }

  Future deleteCustomer(NewCustomer NewCustomers) {
    return FirebaseFirestore.instance
        .collection('admins')
        .doc(admin!.uid)
        .collection("newcustomers")
        .doc(NewCustomers.id)
        .delete();
  }

  Future shareCustomerModel(NewCustomer NewCustomers) async {
    final String name = NewCustomers.name;
    final String ngword = NewCustomers.ngword;
    // firestoreに追加
    await FirebaseFirestore.instance.collection("ngwords").add({
      "name": name,
      "ngword": ngword,
    });
    notifyListeners();
  }

  Future addNextCustomer(NewCustomer NewCustomers) async {
    final String name = NewCustomers.name;
    final String age = NewCustomers.age;
    final String birthday = NewCustomers.birthday;
    final String hobby = NewCustomers.hobby;
    final String count = NewCustomers.count;
    final String number = NewCustomers.number;
    final String ngword = NewCustomers.ngword;
    // firestoreに追加
    await FirebaseFirestore.instance
        .collection("players")
        .doc("BzIeHu2FWnh05hvBF37DXbRDf0m2")
        .collection("nextcustomers")
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
