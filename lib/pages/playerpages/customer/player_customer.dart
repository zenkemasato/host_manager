// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names,
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:host_manager/domein/costomer.dart';
import 'package:host_manager/pages/playerpages/customer/addcustomer/add_customer.dart';
import 'package:host_manager/pages/playerpages/customer/editcustomer/edit_customer.dart';
import 'package:host_manager/pages/playerpages/customer/player_customer_model.dart';
import 'package:host_manager/sidemanu/player_sidemanu.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerCustomer extends StatefulWidget {
  static const String routesName = "/playercustomer";

  const PlayerCustomer({Key? key}) : super(key: key);

  @override
  _PlayerCustomerState createState() => _PlayerCustomerState();
}

class _PlayerCustomerState extends State<PlayerCustomer> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlayerCustomerModel>(
        create: (_) => PlayerCustomerModel()..fechCustomerList(),
        child: Scaffold(
            // アプリのヘッダー
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.pink[200],
              title: const SafeArea(
                child: SizedBox(
                  height: 100,
                  child: Text(
                    "顧客一覧",
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
            body:
                Consumer<PlayerCustomerModel>(builder: (context, model, child) {
              final List<Customer>? Customers = model.Customers;

              if (Customers == null) {
                return const Center(child: CircularProgressIndicator());
              }

              final List<Widget> widgets = Customers.map((Customer) =>
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
                              coutionDialog(context, Customer, model),
                        ),
                      ],
                    ),
                    // 顧客データ
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: ListTile(
                        title: Text(Customer.name + "様"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Customer.age + "歳"),
                            Text("誕生日 : " + Customer.birthday),
                            Text("趣味 : " + Customer.hobby),
                            Text(Customer.count + "回来店"),
                            Text("電話番号 : " + Customer.number),
                            Text("NGワード : " + Customer.ngword),
                          ],
                        ),
                        trailing: Column(children: [
                          // shareボタン
                          GestureDetector(
                            onTap: () {
                              // shareしたものをNGワードモデルに格納
                              model.shareCustomerModel(Customer);
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
                          //editボタン
                          GestureDetector(
                            onTap: () async {
                              // 画面遷移
                              final String? name = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditCustomer(Customer),
                                ),
                              );

                              if (name != null) {
                                final snackBar = SnackBar(
                                  backgroundColor: const Color(0xFFF48FB1),
                                  content: Text(
                                    '$name様を更新しました',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                              model.fechCustomerList();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // deleteボタン
                        ]),
                      ),
                    ),
                  )).toList();
              return ListView(
                children: widgets,
              );
            }),

            // 追加ボタン
            floatingActionButton:
                Consumer<PlayerCustomerModel>(builder: (context, model, child) {
              return FloatingActionButton(
                onPressed: () async {
                  // 画面遷移
                  final bool? added = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddCustomer(),
                      fullscreenDialog: true,
                    ),
                  );

                  if (added != null && added) {
                    const snackBar = SnackBar(
                      backgroundColor: Color(0xFFF48FB1),
                      content: Text(
                        '顧客情報を追加しました',
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
    Customer customer,
    PlayerCustomerModel model,
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
