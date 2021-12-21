// ignore_for_file: avoid_unnecessary_containers, unused_local_variable, avoid_types_as_parameter_names, non_constant_identifier_names
import 'package:host_manager/domein/costomer.dart';
import 'package:host_manager/pages/playerpages/customer/addcustomer/add_customer.dart';
import 'package:host_manager/pages/playerpages/customer/player_customer_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerCustomer extends StatefulWidget {
  const PlayerCustomer({Key? key}) : super(key: key);

  @override
  _PlayerCustomerState createState() => _PlayerCustomerState();
}

class _PlayerCustomerState extends State<PlayerCustomer> {
  bool isShow = false;

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
                    "HostManager",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            drawer: const Drawer(),
            // メイン画面
            body:
                Consumer<PlayerCustomerModel>(builder: (context, model, child) {
              final List<Customer>? Customers = model.Customers;

              if (Customers == null) {
                return const Center(child: CircularProgressIndicator());
              }

              final List<Widget> widgets = Customers.map((Customer) => ListTile(
                    // 詳細切り替えボタン
                    leading: isShow == true
                        ? IconButton(
                            icon: const Icon(Icons.expand_less),
                            onPressed: () {
                              setState(() {
                                isShow = !isShow; //切り替え
                              });
                            },
                          )
                        : IconButton(
                            icon: const Icon(Icons.navigate_next),
                            onPressed: () {
                              setState(() {
                                isShow = !isShow; //切り替え
                              });
                            },
                          ),
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
                    trailing: const Icon(Icons.more_vert_outlined),
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
              );
            })));
  }
}
