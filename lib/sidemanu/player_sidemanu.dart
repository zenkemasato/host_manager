// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/pages/routing.dart';

class PlayerSideMenu extends StatelessWidget {
  const PlayerSideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 150,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ユーザーページ
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.playeruser);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.withOpacity(0.5),
                            image: const DecorationImage(
                                image: AssetImage("images/playericon.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("まりちゃん"),
                    const SizedBox(height: 10),
                    const Text('メニュー'),
                  ],
                ),
              ),
            ),
            // 顧客管理
            ListTile(
              title: const Text("顧客管理"),
              leading: const Icon(Icons.person_search),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .pushReplacementNamed(Routes.playercustomer);
              },
            ),
            // 顧客見込み
            ListTile(
              title: const Text("顧客見込み"),
              leading: const Icon(Icons.person_search),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .pushReplacementNamed(Routes.playernextcustomer);
              },
            ),
            // 出勤管理
            ListTile(
              title: const Text("出勤管理"),
              leading: const Icon(Icons.note_alt_outlined),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(Routes.playeradverd);
              },
            ),
            // NGワード管理
            ListTile(
              title: const Text("NGワード"),
              leading: const Icon(Icons.cancel_outlined),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(Routes.playerngword);
              },
            ),
            // オーダー
            ListTile(
              title: const Text("オーダー"),
              leading: const Icon(Icons.notifications_on_rounded),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(Routes.playerorder);
              },
            ),
          ],
        ),
      ),
    );
  }
}
