import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NgwordPage extends StatefulWidget {
  static const String routesName = "/ngwordpage";

  const NgwordPage({Key? key}) : super(key: key);

  @override
  _NgwordPageState createState() => _NgwordPageState();
}

class _NgwordPageState extends State<NgwordPage> {
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
        body: const Center(child: Text("NGワード")));
  }
}
