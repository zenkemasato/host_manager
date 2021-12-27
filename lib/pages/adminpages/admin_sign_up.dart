// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../routing.dart';
import 'admin_sign_up_model.dart';

class AdminSignUp extends StatelessWidget {
  static const String routesName = "/adminsignup";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AdminSignUpModel>(
      create: (_) => AdminSignUpModel(),
      child: Scaffold(
        // アドミンヘッダー
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const SafeArea(
            child: SizedBox(
              height: 100,
              child: Text(
                "新規登録",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
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
                  Consumer<AdminSignUpModel>(builder: (context, model, child) {
                return Padding(
                  padding: const EdgeInsets.all(50),
                  // 更新フォーム
                  child: Column(
                    children: [
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
                            await model.adminSignUpModel();

                            Navigator.of(context)
                                .pushReplacementNamed(Routes.admincustomer);
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
