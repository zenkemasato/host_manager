// ignore_for_file: equal_keys_in_map

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/pages/adminpages/adverd/admin_adverd.dart';
import 'package:host_manager/pages/adminpages/customer/admin_customer.dart';
import 'package:host_manager/pages/adminpages/items/admin_items.dart';
import 'package:host_manager/pages/adminpages/order/admin_odaer.dart';
import 'package:host_manager/pages/adminpages/salary/admin_salary.dart';
import 'package:host_manager/pages/adminpages/sales/admin_sales.dart';
import 'package:host_manager/pages/adminpages/staff/admin_staff.dart';
import 'package:host_manager/pages/main_page.dart';
import 'package:host_manager/pages/playerpages/adverd/player_adverd.dart';
import 'package:host_manager/pages/playerpages/customer/player_customer.dart';
import 'package:host_manager/pages/playerpages/ngword/player_ngword.dart';
import 'package:host_manager/pages/playerpages/oder/player_oder.dart';
import 'package:host_manager/pages/playerpages/user/userpage.dart';
import 'package:host_manager/pages/routing.dart';
import 'pages/adminpages/ngword/admin_ngword.dart';
import 'pages/adminpages/user/admin_user.dart';
import 'pages/boypages/adverd/boy_adverd.dart';
import 'pages/boypages/ngword/boy_ngword.dart';
import 'pages/boypages/order/boy_order.dart';
import 'pages/boypages/user/boy_user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AdminCusromer(),
      routes: <String, WidgetBuilder>{
        // ホーム Routes
        Routes.home: (BuildContext context) => const MainPage(),
        // Player Routes
        Routes.playercustomer: (BuildContext context) => const PlayerCustomer(),
        Routes.playeruser: (BuildContext context) => const PlayerUser(),
        Routes.playeradverd: (BuildContext context) => const PlayerAdverd(),
        Routes.playerngword: (BuildContext context) => const PlayerNgword(),
        Routes.playerorder: (BuildContext context) => const PlayerOrder(),
        // Boy Routes
        Routes.boyuser: (BuildContext context) => const BoyUser(),
        Routes.boyorder: (BuildContext context) => const BoyOrder(),
        Routes.boyngword: (BuildContext context) => const BoyNgword(),
        Routes.boyadverd: (BuildContext context) => const BoyAdverd(),
        // Admin Routes
        Routes.adminuser: (BuildContext context) => const AdminUser(),
        Routes.adminstuff: (BuildContext context) => const AdminStuff(),
        Routes.adminsales: (BuildContext context) => const AdminSales(),
        Routes.adminsalaty: (BuildContext context) => const AdminSalary(),
        Routes.adminngword: (BuildContext context) => const AdminNgword(),
        Routes.adminitems: (BuildContext context) => const AdminItems(),
        Routes.adminorder: (BuildContext context) => const AdminOrder(),
        Routes.admincustomer: (BuildContext context) => const AdminCusromer(),
        Routes.adminadvers: (BuildContext context) => const AdminAdverd(),
      },
    );
  }
}
