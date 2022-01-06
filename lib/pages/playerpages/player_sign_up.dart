// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers
import 'package:host_manager/pages/playerpages/palyer_sign_up_model.dart';
import 'package:host_manager/pages/routing.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerSignUp extends StatelessWidget {
  static const String routesName = "/playersignup";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlayerSignUpModel>(
      create: (_) => PlayerSignUpModel(),
      child: Scaffold(
        // アプリのヘッダー
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink[200],
          title: const SafeArea(
            child: SizedBox(
              height: 100,
              child: Text(
                "新規登録",
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
          child: Stack(
            children: [
              Container(child:
                  Consumer<PlayerSignUpModel>(builder: (context, model, child) {
                return Padding(
                  padding: const EdgeInsets.all(50),
                  // 更新フォーム
                  child: Column(
                    children: [
                      // 名前フォーム
                      TextFormField(
                          controller: model.nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Player名',
                            icon: Icon(Icons.markunread_outlined),
                          ),
                          onChanged: (text) {
                            model.setEmail(text);
                          }),
                      const SizedBox(height: 20),
                      // 年齢フォーム
                      TextFormField(
                          controller: model.ageController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '年齢',
                            icon: Icon(Icons.markunread_outlined),
                          ),
                          onChanged: (text) {
                            model.setEmail(text);
                          }),
                      const SizedBox(height: 20),
                      // emailフォーム
                      TextFormField(
                          controller: model.emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'E-mail',
                            icon: Icon(Icons.markunread_outlined),
                          ),
                          onChanged: (text) {
                            model.setEmail(text);
                          }),
                      const SizedBox(height: 20),
                      // passwordフォーム
                      TextFormField(
                        controller: model.passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'パスワード',
                          icon: Icon(Icons.vpn_key),
                        ),
                        onChanged: (text) {
                          model.setPassword(text);
                        },
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.pink[200]),
                        onPressed: () async {
                          model.startLoading();
                          try {
                            await model.playerSignUpModel();

                            Navigator.of(context)
                                .pushReplacementNamed(Routes.playercustomer);
                          } catch (e) {
                            final snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(e.toString()),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } finally {
                            model.endLoading();
                          }
                        },
                        child: const Text('新規登録',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                );
              }))
            ],
          ),
        ),
      ),
    );
  }
}
