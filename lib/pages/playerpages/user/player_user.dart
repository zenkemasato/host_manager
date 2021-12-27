// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/sidemanu/player_sidemanu.dart';
import 'package:host_manager/widgets/app_large_text.dart';
import 'package:host_manager/widgets/app_text.dart';
import 'package:provider/provider.dart';
import '../../routing.dart';
import 'player_user_model.dart';

class PlayerUser extends StatelessWidget {
  static const String routesName = "/playeruser";

  const PlayerUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlayerUserModel>(
      create: (_) => PlayerUserModel()..fetcUser(),
      child: Scaffold(
        // アプリのヘッダー
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink[200],
          title: const SafeArea(
            child: SizedBox(
              height: 100,
              child: Text(
                "マイページ",
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(child:
              Consumer<PlayerUserModel>(builder: (context, model, child) {
            return Column(children: [
              Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    // 背景画面
                    Container(
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            image: const DecorationImage(
                                image: AssetImage("images/host1.jpeg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    // 画像ボタン
                    Positioned(
                      right: 10, bottom: 10,
                      // 画像右下
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.camera_alt),
                      ),
                    ),
                    // メイン画像
                    Positioned(
                      top: 150,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black54.withOpacity(0.3),
                                width: 2),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.withOpacity(0.5),
                            image: const DecorationImage(
                                image: AssetImage("images/boyicon.jpeg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ]),
              const SizedBox(height: 70),
              AppLargeText(
                text: "まりちゃん",
              ),
              AppText(
                text: model.email ?? "メールアドレスなし",
              ),
              AppText(
                text: "時間はお金で買えない資産",
              ),
              const SizedBox(height: 30),
              // 編集ボタン
              Container(
                margin: const EdgeInsets.all(30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.pink[200]),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: "プロフィールを編集する",
                          color: Colors.white,
                        ),
                        const Icon(Icons.mode_edit),
                      ],
                    )),
              ),
              const SizedBox(height: 20),
              // ログアウト　インフォ
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ログアウト
                  Container(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.blue),
                        onPressed: () {
                          model.signOut();
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.home);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              text: "ログアウト",
                              color: Colors.white,
                            ),
                            const Icon(Icons.logout),
                          ],
                        )),
                  ),
                  // 情報
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.info),
                  ),
                ],
              )
            ]);
          })),
        ),
      ),
    );
  }
}
