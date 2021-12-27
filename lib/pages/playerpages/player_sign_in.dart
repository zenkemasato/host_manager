// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers
import 'package:host_manager/pages/playerpages/player_sign_in_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../routing.dart';

class PlayerSignIn extends StatelessWidget {
  static const String routesName = "/playersignin";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlayerSignInModel>(
      create: (_) => PlayerSignInModel(),
      child: Scaffold(
        // アプリのヘッダー
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink[200],
          title: const SafeArea(
            child: SizedBox(
              height: 100,
              child: Text(
                "ログイン",
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
              Consumer<PlayerSignInModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(50),
              // 更新フォーム
              child: Column(
                children: [
                  // email
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
                  // password
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
                    style: ElevatedButton.styleFrom(primary: Colors.pink[200]),
                    onPressed: () async {
                      try {
                        await model.playerSignInModel();

                        Navigator.of(context)
                            .pushReplacementNamed(Routes.playercustomer);
                      } catch (e) {
                        final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(e.toString()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text('ログイン',
                        style: TextStyle(color: Colors.white)),
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
