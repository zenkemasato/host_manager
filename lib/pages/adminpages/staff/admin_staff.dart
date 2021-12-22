import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/sidemanu/admin_sidemanu.dart';
import 'package:host_manager/widgets/app_large_text.dart';

class AdminStuff extends StatelessWidget {
  const AdminStuff({Key? key}) : super(key: key);

  static const String routesName = "/adminstuff";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // アドミンヘッダー
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const SafeArea(
          child: SizedBox(
            height: 100,
            child: Text(
              "Stuff管理",
              style: TextStyle(
                  fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      drawer: const AdminSideManu(),
      body: Center(
          child: AppLargeText(
        text: "Stuff管理",
      )),
    );
  }
}
