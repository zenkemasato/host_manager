// ignore_for_file: avoid_unnecessary_containers, unused_local_variable,, unnecessary_const, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
// avoid_types_as_parameter_names, non_constant_identifier_names
import 'package:host_manager/domein/costomer.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit_customer_model.dart';

class EditCustomer extends StatelessWidget {
  // Customerの値を先に入れておく
  final Customer customer;
  EditCustomer(this.customer);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditCustomerModel>(
      create: (_) => EditCustomerModel(customer),
      child: Scaffold(
        // アプリのヘッダー
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink[200],
          title: const SafeArea(
            child: SizedBox(
              height: 100,
              child: Text(
                "顧客編集",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        // メイン画面
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(child:
              Consumer<EditCustomerModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(50),
              // 更新フォーム
              child: Column(
                children: [
                  // 名前更新フォーム
                  TextFormField(
                      controller: model.namecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '名前',
                        icon: Icon(Icons.person_sharp),
                      ),
                      onChanged: (text) {
                        model.setName(text);
                      }),
                  const SizedBox(height: 20),
                  // 年齢更新フォーム
                  TextFormField(
                      controller: model.agecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '年齢',
                        icon: Icon(Icons.auto_graph),
                      ),
                      onChanged: (text) {
                        model.setAge(text);
                      }),
                  const SizedBox(height: 20),
                  // 誕生日更新フォーム
                  TextFormField(
                      controller: model.birthdaycontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '誕生日',
                        icon: Icon(Icons.cake_outlined),
                      ),
                      onChanged: (text) {
                        model.setBirthDay(text);
                      }),
                  const SizedBox(height: 20),
                  // 趣味更新フォーム
                  TextFormField(
                      controller: model.hobbycontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '趣味',
                        icon: Icon(Icons.free_breakfast),
                      ),
                      onChanged: (text) {
                        model.setHobby(text);
                      }),
                  const SizedBox(height: 20),
                  // 来店回数更新フォーム
                  TextFormField(
                      controller: model.countcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '来店回数',
                        icon: Icon(Icons.repeat_rounded),
                      ),
                      onChanged: (text) {
                        model.setCount(text);
                      }),
                  const SizedBox(height: 20),
                  // 電話番号更新フォーム
                  TextFormField(
                      controller: model.numbercontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '電話番号',
                        icon: Icon(Icons.call_rounded),
                      ),
                      onChanged: (text) {
                        model.setNumber(text);
                      }),
                  const SizedBox(height: 30),
                  // NGワード更新フォーム
                  TextFormField(
                      controller: model.ngwordcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'NGワード',
                        icon: Icon(Icons.cancel_outlined),
                      ),
                      onChanged: (text) {
                        model.setNgword(text);
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
                        onPressed: model.isUpdated()
                            ? () async {
                                try {
                                  await model.editCustomerModel();
                                  Navigator.of(context).pop(model.name);
                                } catch (e) {
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(e.toString()),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            : null,
                        child: const Text('更新する',
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
