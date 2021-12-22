import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/sidemanu/admin_sidemanu.dart';

class AdminUser extends StatelessWidget {
  const AdminUser({Key? key}) : super(key: key);

  static const String routesName = "/adminuser";

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
              "Adminユーザー",
              style: TextStyle(
                  fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      drawer: const AdminSideManu(),
      body: const Center(
        child: Icon(
          Icons.people_alt_sharp,
          size: 100,
        ),
      ),
    );
  }
}
