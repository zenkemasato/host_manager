import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/sidemanu/boy_sidemanu.dart';

class BoyUser extends StatelessWidget {
  const BoyUser({Key? key}) : super(key: key);
  static const String routesName = "/boyuser";

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
              "Boyユーザー",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      drawer: const BoySideMenu(),
      body: const Center(
        child: Icon(
          Icons.people_alt_sharp,
          size: 100,
        ),
      ),
    );
  }
}
