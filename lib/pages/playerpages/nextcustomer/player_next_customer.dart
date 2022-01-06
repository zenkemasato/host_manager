// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:host_manager/domein/next_customer.dart';
import 'package:host_manager/sidemanu/player_sidemanu.dart';
import 'package:provider/provider.dart';

import 'addnextcustomer/add_next_customer.dart';
import 'player_next_customer_model.dart';

class PlayerNextCustomer extends StatefulWidget {
  static const String routesName = "/playernextcustomer";

  const PlayerNextCustomer({Key? key}) : super(key: key);

  @override
  _PlayerNextCustomerState createState() => _PlayerNextCustomerState();
}

class _PlayerNextCustomerState extends State<PlayerNextCustomer> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlayerNextCustomerModel>(
        create: (_) => PlayerNextCustomerModel()..fechCustomerList(),
        child: Scaffold(
            // アプリのヘッダー
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.pink[200],
              title: const SafeArea(
                child: SizedBox(
                  height: 100,
                  child: Text(
                    "顧客見込",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            drawer: const PlayerSideMenu(),
            // メイン画面
            body: Consumer<PlayerNextCustomerModel>(
                builder: (context, model, child) {
              final List<NextCustomer>? NextCustomers = model.NextCustomers;
              if (NextCustomers == null) {
                return const Center(child: CircularProgressIndicator());
              }

              final List<Widget> widgets = NextCustomers.map((NextCustomer) =>
                  // スライダーメニュー
                  Slidable(
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: '削除',
                          onPressed: (context) =>
                              coutionDialog(context, NextCustomer, model),
                        ),
                      ],
                    ),
                    // 顧客データ
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: ListTile(
                        title: Text(NextCustomer.name + "様"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(NextCustomer.age + "歳"),
                            Text("誕生日 : " + NextCustomer.birthday),
                            Text("趣味 : " + NextCustomer.hobby),
                            Text(NextCustomer.count + "回来店"),
                            Text("電話番号 : " + NextCustomer.number),
                            Text("NGワード : " + NextCustomer.ngword),
                          ],
                        ),
                        trailing: Column(children: [
                          // shareボタン
                          GestureDetector(
                            onTap: () {
                              // shareしたものをNGワードモデルに格納
                              model.shareCustomerModel(NextCustomer);
                              var snackBar = const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'NGワードに追加しました',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.green),
                              child: const Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // pushボタン
                          GestureDetector(
                            onTap: () {
                              // pushしたものをNextCustomerに格納
                              model.addCustomer(NextCustomer);
                              var snackBar = const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'まりちゃんの顧客に追加しました',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              model.deleteCustomer(NextCustomer);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue),
                              child: const Icon(
                                Icons.reply_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  )).toList();
              return ListView(
                children: widgets,
              );
            }),

            // 追加ボタン
            floatingActionButton: Consumer<PlayerNextCustomerModel>(
                builder: (context, model, child) {
              return FloatingActionButton(
                onPressed: () async {
                  // 画面遷移
                  final bool? added = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddNextCustomer(),
                      fullscreenDialog: true,
                    ),
                  );

                  if (added != null && added) {
                    const snackBar = SnackBar(
                      backgroundColor: Color(0xFFF48FB1),
                      content: Text(
                        '新規顧客を追加しました',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  model.fechCustomerList();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
                backgroundColor: Colors.pink[200],
              );
            })));
  }

  // 削除するためのダイアログ
  void coutionDialog(
    BuildContext context,
    NextCustomer customer,
    PlayerNextCustomerModel model,
  ) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => CupertinoAlertDialog(
                title: const Text(
                  "Coution",
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
                content: Text("${customer.name}様を削除しますか？"),
                actions: [
                  CupertinoDialogAction(
                      child: const Text('いいえ'),
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  CupertinoDialogAction(
                      child: const Text('はい'),
                      onPressed: () async {
                        await model.deleteCustomer(customer);
                        final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            '${customer.name}様を削除しました',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                        model.fechCustomerList();
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      })
                ]));
  }
}
