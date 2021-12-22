import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/sidemanu/player_sidemanu.dart';

class PlayerNgword extends StatefulWidget {
  static const String routesName = "/playerngword";

  const PlayerNgword({Key? key}) : super(key: key);

  @override
  _PlayerNgwordState createState() => _PlayerNgwordState();
}

class _PlayerNgwordState extends State<PlayerNgword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink[200],
          title: const SafeArea(
            child: SizedBox(
              height: 100,
              child: Text(
                "NGワード",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        drawer: const PlayerSideMenu(),
        body: const Center(child: Text("NGワード")));
  }
}
