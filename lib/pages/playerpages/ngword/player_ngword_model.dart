// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:host_manager/domein/ngword.dart';

class PlayerNgwordModel extends ChangeNotifier {
  List<Ngword>? Ngwords;

  // firebaseから値を読み取り、snapshotに格納
  void fechNgwordList() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('ngwords').get();
    // snapshot型のデータをMap型に変え、Ngwordに代入
    final List<Ngword> Ngwords = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String name = data["name"];
      final String ngword = data["ngword"];
      // 取得した値をNgwordモデルに代入
      return Ngword(id, name, ngword);
    }).toList();
    // それぞれの値を初期化されたNgwordに代入
    this.Ngwords = Ngwords;
    notifyListeners();
  }
}
