import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/sidemanu/player_sidemanu.dart';

class PlayerAdverd extends StatefulWidget {
  static const String routesName = "/playeradverd";

  const PlayerAdverd({Key? key}) : super(key: key);

  @override
  _PlayerAdverdState createState() => _PlayerAdverdState();
}

class _PlayerAdverdState extends State<PlayerAdverd> {
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
                "出勤管理",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        drawer: const PlayerSideMenu(),
        body: const Center(child: Text("出勤管理")));
  }
}
