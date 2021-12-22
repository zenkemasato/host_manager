import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/sidemanu/player_sidemanu.dart';

class PlayerUser extends StatefulWidget {
  static const String routesName = "/playeruser";

  const PlayerUser({Key? key}) : super(key: key);

  @override
  _PlayerUserState createState() => _PlayerUserState();
}

class _PlayerUserState extends State<PlayerUser> {
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
                "Playerユーザー",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        drawer: const PlayerSideMenu(),
        body: Container());
  }
}
