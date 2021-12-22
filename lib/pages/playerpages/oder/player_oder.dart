import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/sidemanu/player_sidemanu.dart';

class PlayerOrder extends StatefulWidget {
  static const String routesName = "/playerorder";

  const PlayerOrder({Key? key}) : super(key: key);

  @override
  _PlayerOrderState createState() => _PlayerOrderState();
}

class _PlayerOrderState extends State<PlayerOrder> {
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
                "オーダー",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        drawer: const PlayerSideMenu(),
        body: const Center(child: Text("オーダー")));
  }
}
