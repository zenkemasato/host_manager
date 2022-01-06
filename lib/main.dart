// ignore_for_file: equal_keys_in_map
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:host_manager/pages/adminpages/adverd/admin_adverd.dart';
import 'package:host_manager/pages/adminpages/newcustomer/admin_new_customer.dart';
import 'package:host_manager/pages/adminpages/ngword/admin_ngword.dart';
import 'package:host_manager/pages/adminpages/admin_sign_up.dart';
import 'package:host_manager/pages/adminpages/customer/admin_customer.dart';
import 'package:host_manager/pages/adminpages/items/admin_items.dart';
import 'package:host_manager/pages/adminpages/order/admin_odaer.dart';
import 'package:host_manager/pages/adminpages/salary/admin_salary.dart';
import 'package:host_manager/pages/adminpages/sales/admin_sales.dart';
import 'package:host_manager/pages/boypages/adverd/boy_adverd.dart';
import 'package:host_manager/pages/boypages/boy_sign_up.dart';
import 'package:host_manager/pages/boypages/ngword/boy_ngword.dart';
import 'package:host_manager/pages/main_page.dart';
import 'package:host_manager/pages/playerpages/adverd/player_adverd.dart';
import 'package:host_manager/pages/playerpages/customer/player_customer.dart';
import 'package:host_manager/pages/playerpages/ngword/player_ngword.dart';
import 'package:host_manager/pages/playerpages/oder/player_oder.dart';
import 'package:host_manager/pages/playerpages/player_sign_in.dart';
import 'package:host_manager/pages/playerpages/player_sign_up.dart';
import 'package:host_manager/pages/playerpages/user/player_user.dart';
import 'package:host_manager/pages/routing.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'pages/adminpages/admin_sign_in.dart';
import 'pages/adminpages/user/admin_user.dart';
import 'pages/boypages/boy_sign_in.dart';
import 'pages/boypages/order/boy_order.dart';
import 'pages/boypages/user/boy_user.dart';
import 'pages/playerpages/nextcustomer/player_next_customer.dart';

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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        SfGlobalLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('zh'),
        Locale('ar'),
        Locale('ja'),
      ],
      locale: const Locale('ja'),
      home: const AdminItems(),
      routes: <String, WidgetBuilder>{
        // ホーム Routes
        Routes.home: (BuildContext context) => const MainPage(),
        // Player Routes
        Routes.playercustomer: (BuildContext context) => const PlayerCustomer(),
        Routes.playeruser: (BuildContext context) => const PlayerUser(),
        Routes.playerorder: (BuildContext context) => const PlayerOrder(),
        Routes.playeradverd: (BuildContext context) => const PlayerAdverd(),
        Routes.playersignin: (BuildContext context) => PlayerSignIn(),
        Routes.playersignup: (BuildContext context) => PlayerSignUp(),
        Routes.playerngword: (BuildContext context) => const PlayerNgword(),
        Routes.playernextcustomer: (BuildContext context) =>
            const PlayerNextCustomer(),
        // Boy Routes
        Routes.boyuser: (BuildContext context) => const BoyUser(),
        Routes.boyorder: (BuildContext context) => const BoyOrder(),
        Routes.boyadverd: (BuildContext context) => const BoyAdverd(),
        Routes.boysignin: (BuildContext context) => BoySignIn(),
        Routes.boysignup: (BuildContext context) => BoySignUp(),
        Routes.boyngword: (BuildContext context) => const BoyNgword(),
        // Admin Routes
        Routes.adminuser: (BuildContext context) => const AdminUser(),
        Routes.adminsales: (BuildContext context) => const AdminSales(),
        Routes.adminsalaty: (BuildContext context) => const AdminSalary(),
        Routes.adminitems: (BuildContext context) => const AdminItems(),
        Routes.adminadverd: (BuildContext context) => const AdminAdverd(),
        Routes.adminorder: (BuildContext context) => const AdminOrder(),
        Routes.admincustomer: (BuildContext context) => const AdminCusromer(),
        Routes.adminsignin: (BuildContext context) => AdminSignIn(),
        Routes.adminsignup: (BuildContext context) => AdminSignUp(),
        Routes.adminngword: (BuildContext context) => const AdminNgword(),
        Routes.adminnewcustomer: (BuildContext context) =>
            const AdminNewCustomer(),
      },
    );
  }
}
