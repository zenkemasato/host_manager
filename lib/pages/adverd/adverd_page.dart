import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdverdPage extends StatefulWidget {
  static const String routesName = "/adverdpage";

  const AdverdPage({Key? key}) : super(key: key);

  @override
  _AdverdPageState createState() => _AdverdPageState();
}

class _AdverdPageState extends State<AdverdPage> {
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
