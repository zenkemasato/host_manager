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
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.withOpacity(0.5),
                            image: const DecorationImage(
                                image: AssetImage("images/usericon.png"),
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
            // メール管理
            ListTile(
              title: const Text("顧客管理"),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .pushReplacementNamed(Routes.playercustomer);
              },
            ),
          ],
        ),
      ),
    );
  }
}
