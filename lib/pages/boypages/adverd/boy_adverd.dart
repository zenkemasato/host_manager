import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/sidemanu/boy_sidemanu.dart';

class BoyAdverd extends StatefulWidget {
  static const String routesName = "/boyadverd";

  const BoyAdverd({Key? key}) : super(key: key);

  @override
  _BoyAdverdState createState() => _BoyAdverdState();
}

class _BoyAdverdState extends State<BoyAdverd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ボーイヘッダー
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const SafeArea(
            child: SizedBox(
              height: 100,
              child: Text(
                "出勤管理",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        drawer: const BoySideMenu(),
        body: const Center(child: Text("出勤管理")));
  }
}
