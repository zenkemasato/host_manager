import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/pages/playerpages/customer/player_customer.dart';
import 'package:host_manager/pages/routing.dart';

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
      home: const PlayerCustomer(),
      routes: <String, WidgetBuilder>{
        Routes.playercustomer: (BuildContext context) => const PlayerCustomer(),
      },
    );
  }
}
