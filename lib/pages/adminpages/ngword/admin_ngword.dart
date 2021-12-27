import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:host_manager/domein/ngword.dart';
import 'package:host_manager/sidemanu/admin_sidemanu.dart';
import 'package:host_manager/widgets/app_text.dart';
import 'package:provider/provider.dart';
import 'admin_ngword_model.dart';

class AdminNgword extends StatefulWidget {
  static const String routesName = "/adminngword";

  const AdminNgword({Key? key}) : super(key: key);

  @override
  _AdminNgwordState createState() => _AdminNgwordState();
}

class _AdminNgwordState extends State<AdminNgword> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AdnimNgwordModle>(
        create: (_) => AdnimNgwordModle()..fechNgwordList(),
        child: Scaffold(
          // アドミンヘッダー
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: const SafeArea(
              child: SizedBox(
                height: 100,
                child: Text(
                  "NGワード",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          drawer: const AdminSideManu(),
          // メイン画面
          body: Consumer<AdnimNgwordModle>(builder: (context, model, child) {
            final List<Ngword>? Ngwords = model.Ngwords;

            if (Ngwords == null) {
              return const Center(child: CircularProgressIndicator());
            }

            final List<Widget> widgets = Ngwords.map((Ngword) =>
                // スライダーメニュー
                Slidable(
                  key: Key(Ngword.id),
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: const [
                      SlidableAction(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: '削除',
                          onPressed: null),
                    ],
                    dismissible: DismissiblePane(
                      onDismissed: () {
                        _deleteNgword(Ngword);
                      },
                    ),
                  ),
                  // 顧客データ
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink, width: 2)),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText(text: "名前   "),
                              AppText(text: Ngword.name),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText(text: "NGワード"),
                              AppText(text: Ngword.ngword),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )).toList();
            return ListView(
              children: widgets,
            );
          }),
        ));
  }

  Future _deleteNgword(Ngword ngword) {
    return FirebaseFirestore.instance
        .collection("ngwords")
        .doc(ngword.id)
        .delete();
  }
}
