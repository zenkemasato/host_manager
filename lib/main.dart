// ignore_for_file: equal_keys_in_map
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/pages/adminpages/ngword/admin_ngword.dart';
import 'package:host_manager/pages/adverd/adverd_page.dart';
import 'package:host_manager/pages/adminpages/admin_sign_up.dart';
import 'package:host_manager/pages/adminpages/customer/admin_customer.dart';
import 'package:host_manager/pages/adminpages/items/admin_items.dart';
import 'package:host_manager/pages/adminpages/order/admin_odaer.dart';
import 'package:host_manager/pages/adminpages/salary/admin_salary.dart';
import 'package:host_manager/pages/adminpages/sales/admin_sales.dart';
import 'package:host_manager/pages/adminpages/staff/admin_staff.dart';
import 'package:host_manager/pages/boypages/boy_sign_up.dart';
import 'package:host_manager/pages/boypages/ngword/boy_ngword.dart';
import 'package:host_manager/pages/main_page.dart';
import 'package:host_manager/pages/playerpages/customer/player_customer.dart';
import 'package:host_manager/pages/playerpages/ngword/player_ngword.dart';
import 'package:host_manager/pages/playerpages/oder/player_oder.dart';
import 'package:host_manager/pages/playerpages/player_sign_in.dart';
import 'package:host_manager/pages/playerpages/player_sign_up.dart';
import 'package:host_manager/pages/playerpages/user/player_user.dart';
import 'package:host_manager/pages/routing.dart';
import 'pages/adminpages/admin_sign_in.dart';
import 'pages/adminpages/user/admin_user.dart';
import 'pages/boypages/boy_sign_in.dart';
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
      home: const MainPage(),
      routes: <String, WidgetBuilder>{
        // ホーム Routes
        Routes.home: (BuildContext context) => const MainPage(),
        // 全画面共通
        Routes.adverdpage: (BuildContext context) => const AdverdPage(),
        // Player Routes
        Routes.playercustomer: (BuildContext context) => const PlayerCustomer(),
        Routes.playeruser: (BuildContext context) => const PlayerUser(),
        Routes.playerorder: (BuildContext context) => const PlayerOrder(),
        Routes.playersignin: (BuildContext context) => PlayerSignIn(),
        Routes.playersignup: (BuildContext context) => PlayerSignUp(),
        Routes.playerngword: (BuildContext context) => const PlayerNgword(),
        // Boy Routes
        Routes.boyuser: (BuildContext context) => const BoyUser(),
        Routes.boyorder: (BuildContext context) => const BoyOrder(),
        Routes.boysignin: (BuildContext context) => BoySignIn(),
        Routes.boysignup: (BuildContext context) => BoySignUp(),
        Routes.boyngword: (BuildContext context) => const BoyNgword(),
        // Admin Routes
        Routes.adminuser: (BuildContext context) => const AdminUser(),
        Routes.adminstuff: (BuildContext context) => const AdminStuff(),
        Routes.adminsales: (BuildContext context) => const AdminSales(),
        Routes.adminsalaty: (BuildContext context) => const AdminSalary(),
        Routes.adminitems: (BuildContext context) => const AdminItems(),
        Routes.adminorder: (BuildContext context) => const AdminOrder(),
        Routes.admincustomer: (BuildContext context) => const AdminCusromer(),
        Routes.adminsignin: (BuildContext context) => AdminSignIn(),
        Routes.adminsignup: (BuildContext context) => AdminSignUp(),
        Routes.adminngword: (BuildContext context) => const AdminNgword(),
      },
    );
  }
}
