import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/sidemanu/boy_sidemanu.dart';

class BoyNgword extends StatefulWidget {
  static const String routesName = "/boyngword";

  const BoyNgword({Key? key}) : super(key: key);

  @override
  _BoyNgwordState createState() => _BoyNgwordState();
}

class _BoyNgwordState extends State<BoyNgword> {
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
                "NGワード",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        drawer: const BoySideMenu(),
        body: const Center(child: Text("NGワード")));
  }
}
