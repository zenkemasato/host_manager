// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:host_manager/domein/item.dart';

class AdnimItemModle extends ChangeNotifier {
  List<Item>? Items;

  // firebaseから値を読み取り、snapshotに格納
  void fechNgwordList() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('items').get();
    // snapshot型のデータをMap型に変え、Ngwordに代入
    final List<Item> Items = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String name = data["name"];
      final String count = data["count"];
      final String cost = data["cost"];
      final String sellplice = data["sellplice"];
      // 取得した値をNgwordモデルに代入
      return Item(id, name, count, cost, sellplice);
    }).toList();
    // それぞれの値を初期化されたNgwordに代入
    this.Items = Items;
    notifyListeners();
  }
}
