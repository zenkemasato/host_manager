import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/sidemanu/boy_sidemanu.dart';

class BoyOrder extends StatefulWidget {
  static const String routesName = "/boyorder";

  const BoyOrder({Key? key}) : super(key: key);

  @override
  _BoyOrderState createState() => _BoyOrderState();
}

class _BoyOrderState extends State<BoyOrder> {
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
                "オーダー",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        drawer: const BoySideMenu(),
        body: const Center(child: Text("オーダー")));
  }
}
