import 'package:flutter/material.dart';
import 'package:host_manager/sidemanu/admin_sidemanu.dart';
import 'package:host_manager/widgets/app_large_text.dart';

class AdminCusromer extends StatelessWidget {
  const AdminCusromer({Key? key}) : super(key: key);

  static const String routesName = "/admincustomer";

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
              "顧客管理",
              style: TextStyle(
                  fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      drawer: const AdminSideManu(),
      body: Center(
          child: AppLargeText(
        text: "顧客管理",
      )),
    );
  }
}
