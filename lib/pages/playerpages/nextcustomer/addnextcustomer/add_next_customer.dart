// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_next_customer_model.dart';

class AddNextCustomer extends StatelessWidget {
  const AddNextCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddNextCustomerModel>(
      create: (_) => AddNextCustomerModel(),
      child: Scaffold(
        // アプリのヘッダー
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink[200],
          title: const SafeArea(
            child: SizedBox(
              height: 100,
              child: Text(
                "顧客追加",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),

        // メイン画面
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(child:
              Consumer<AddNextCustomerModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(50),
              // 登録フォーム
              child: Column(
                children: [
                  // 名前フォーム
                  TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '名前',
                        icon: Icon(Icons.person_sharp),
                      ),
                      onChanged: (text) {
                        model.name = text;
                      }),
                  const SizedBox(height: 20),
                  // 年齢フォーム
                  TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '年齢',
                        icon: Icon(Icons.auto_graph),
                      ),
                      onChanged: (text) {
                        model.age = text;
                      }),
                  const SizedBox(height: 20),
                  // 誕生日フォーム
                  TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '誕生日',
                        icon: Icon(Icons.cake_outlined),
                      ),
                      onChanged: (text) {
                        model.birthday = text;
                      }),
                  const SizedBox(height: 20),
                  // 趣味フォーム
                  TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '趣味',
                        icon: Icon(Icons.free_breakfast),
                      ),
                      onChanged: (text) {
                        model.hobby = text;
                      }),
                  const SizedBox(height: 20),
                  // 来店回数フォーム
                  TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '来店回数',
                        icon: Icon(Icons.repeat_rounded),
                      ),
                      onChanged: (text) {
                        model.count = text;
                      }),
                  const SizedBox(height: 20),
                  // 電話番号フォーム
                  TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '電話番号',
                        icon: Icon(Icons.call_rounded),
                      ),
                      onChanged: (text) {
                        model.number = text;
                      }),
                  const SizedBox(height: 30),
                  // NGワードフォーム
                  TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'NGワード',
                        icon: Icon(Icons.cancel_outlined),
                      ),
                      onChanged: (text) {
                        model.ngword = text;
                      }),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.red[300]),
                        onPressed: () {
                          model.name = "";
                          model.age = "";
                          model.birthday = "";
                          model.hobby = "";
                          model.count = "";
                          model.number = "";
                          model.ngword = "";
                        },
                        child: const Text('リセット',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.pink[200]),
                        onPressed: () async {
                          try {
                            await model.addNextCustomerModel();
                            Navigator.of(context).pop(true);
                          } catch (e) {
                            final snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(e.toString()),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: const Text('リスト追加',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            );
          })),
        ),
      ),
    );
  }
}
