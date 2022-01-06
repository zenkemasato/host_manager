// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:host_manager/domein/item.dart';
import 'package:host_manager/sidemanu/admin_sidemanu.dart';
import 'package:host_manager/widgets/app_text.dart';
import 'package:provider/provider.dart';
import 'admin_item_model.dart';

class AdminItems extends StatefulWidget {
  static const String routesName = "/adminitem";

  const AdminItems({Key? key}) : super(key: key);

  @override
  _AdminItemsState createState() => _AdminItemsState();
}

class _AdminItemsState extends State<AdminItems> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AdnimItemModle>(
        create: (_) => AdnimItemModle()..fechNgwordList(),
        child: Scaffold(
          // アドミンヘッダー
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: const SafeArea(
              child: SizedBox(
                height: 100,
                child: Text(
                  "商品一覧",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          drawer: const AdminSideManu(),
          // メイン画面
          body: Consumer<AdnimItemModle>(builder: (context, model, child) {
            final List<Item>? Items = model.Items;
            if (Items == null) {
              return const Center(child: CircularProgressIndicator());
            }
            final List<Widget> widgets = Items.map((Items) =>
                // スライダーメニュー
                Slidable(
                  key: Key(Items.id),
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: const [
                      SlidableAction(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: '削除',
                          onPressed: null),
                    ],
                    dismissible: DismissiblePane(
                      onDismissed: () {
                        _deleteItem(Items);
                      },
                    ),
                  ),
                  // 顧客データ
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink, width: 2)),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText(text: "商品名   "),
                              AppText(text: "値段"),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText(text: Items.name),
                              AppText(text: Items.sellplice + "円"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )).toList();
            return ListView(
              children: widgets,
            );
          }),
        ));
  }

  Future _deleteItem(Item Items) {
    return FirebaseFirestore.instance
        .collection("ngwords")
        .doc(Items.id)
        .delete();
  }
}
