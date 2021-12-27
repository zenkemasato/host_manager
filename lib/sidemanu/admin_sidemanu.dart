// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/pages/routing.dart';

class AdminSideManu extends StatelessWidget {
  const AdminSideManu({Key? key}) : super(key: key);

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
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.adminuser);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.withOpacity(0.5),
                            image: const DecorationImage(
                                image: AssetImage("images/adminicon.jpeg"),
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
                    .pushReplacementNamed(Routes.admincustomer);
              },
            ),
            // 出勤管理
            ListTile(
              title: const Text("出勤管理"),
              leading: const Icon(Icons.note_alt_outlined),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(Routes.adverdpage);
              },
            ),
            // Stuff管理
            ListTile(
              title: const Text("Stuff管理"),
              leading: const Icon(Icons.settings_accessibility_outlined),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(Routes.adminstuff);
              },
            ),
            // 給与管理
            ListTile(
              title: const Text("給与管理"),
              leading: const Icon(Icons.monetization_on_outlined),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(Routes.adminsalaty);
              },
            ),
            // 売上管理
            ListTile(
              title: const Text("売上管理"),
              leading: const Icon(Icons.trending_up_outlined),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(Routes.adminsales);
              },
            ),
            // 商品管理
            ListTile(
              title: const Text("商品管理"),
              leading: const Icon(Icons.sports_bar),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(Routes.adminitems);
              },
            ),
            // NGワード管理
            ListTile(
              title: const Text("NGワード"),
              leading: const Icon(Icons.cancel_outlined),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(Routes.ngwordpage);
              },
            ),
            // オーダー
            ListTile(
              title: const Text("オーダー"),
              leading: const Icon(Icons.notifications_on_rounded),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(Routes.adminorder);
              },
            ),
          ],
        ),
      ),
    );
  }
}
