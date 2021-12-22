// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/pages/playerpages/player_sign_in.dart';
import 'package:host_manager/pages/playerpages/player_sign_up.dart';
import 'package:host_manager/widgets/app_large_text.dart';
import 'package:host_manager/widgets/app_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // トップイメージ
  List images = [
    "host1.jpeg",
    "host2.jpeg",
    "host3.jpeg",
  ];
  // それぞれにそれぞれのログイン、サインインができるroutingを載せる
  List sub = ["Playerの方", "Boyの方", "Adminの方"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(
                            text: "judy&judy",
                            color: Colors.red,
                            size: 40,
                          ),
                          AppText(
                            text: sub[index],
                            size: 30,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          AppText(
                            text: "ログインはこちらから",
                            size: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlayerSignIn()));
                            },
                            child: AppText(
                              text: "ログイン",
                              color: Colors.white,
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.pink[200]),
                          ),
                          AppText(
                            text: "新規登録はこちらから",
                            size: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlayerSignUp()));
                            },
                            child: AppText(
                              text: "新規登録",
                            ),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                          children: List.generate(
                        images.length,
                        (indexDots) {
                          return Container(
                              margin: const EdgeInsets.only(bottom: 3),
                              width: 8,
                              height: index == indexDots ? 25 : 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexDots
                                    ? Colors.pink[200]
                                    : Colors.grey.withOpacity(0.5),
                              ));
                        },
                      ))
                    ]),
              ),
            );
          }),
    );
  }
}
