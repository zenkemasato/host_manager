// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:host_manager/domein/new_customer.dart';
import 'package:host_manager/sidemanu/admin_sidemanu.dart';
import 'package:provider/provider.dart';
import 'addnewcustomer/add_new_customer.dart';
import 'admin_new_customer_model.dart';

class AdminNewCustomer extends StatefulWidget {
  static const String routesName = "/adminnewcustomer";

  const AdminNewCustomer({Key? key}) : super(key: key);

  @override
  _AdminNewCustomerState createState() => _AdminNewCustomerState();
}

class _AdminNewCustomerState extends State<AdminNewCustomer> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AdminNewCustomerModel>(
        create: (_) => AdminNewCustomerModel()..fechCustomerList(),
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              title: const SafeArea(
                child: SizedBox(
                  height: 100,
                  child: Text(
                    "新規顧客",
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
            body: Consumer<AdminNewCustomerModel>(
                builder: (context, model, child) {
              final List<NewCustomer>? NewCustomers = model.NewCustomers;

              if (NewCustomers == null) {
                return const Center(child: CircularProgressIndicator());
              }

              final List<Widget> widgets = NewCustomers.map((NewCustomer) =>
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
                              coutionDialog(context, NewCustomer, model),
                        ),
                      ],
                    ),
                    // 顧客データ
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: ListTile(
                        title: Text(NewCustomer.name + "様"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(NewCustomer.age + "歳"),
                            Text("誕生日 : " + NewCustomer.birthday),
                            Text("趣味 : " + NewCustomer.hobby),
                            Text(NewCustomer.count + "回来店"),
                            Text("電話番号 : " + NewCustomer.number),
                            Text("NGワード : " + NewCustomer.ngword),
                          ],
                        ),
                        trailing: Column(children: [
                          // shareボタン
                          GestureDetector(
                            onTap: () {
                              // shareしたものをNGワードモデルに格納
                              model.shareCustomerModel(NewCustomer);
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
                              model.addNextCustomer(NewCustomer);
                              var snackBar = const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'まりちゃん見込み顧客に追加しました',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              model.deleteCustomer(NewCustomer);
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
            floatingActionButton: Consumer<AdminNewCustomerModel>(
                builder: (context, model, child) {
              return FloatingActionButton(
                onPressed: () async {
                  // 画面遷移
                  final bool? added = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddNewCustomer(),
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
    NewCustomer customer,
    AdminNewCustomerModel model,
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
                        Navigator.of(context).pop();
                      }),
                  CupertinoDialogAction(
                      child: const Text('はい'),
                      onPressed: () async {
                        await model.deleteCustomer(customer);
                        Navigator.pop(context);
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
