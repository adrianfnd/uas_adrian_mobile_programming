import 'package:flutter/material.dart';
import 'dart:async';

import 'package:uas_adrian_mobile_programming/models/perwalian.dart';
import 'package:uas_adrian_mobile_programming/database/db_perwalian.dart';
import 'package:uas_adrian_mobile_programming/pages/user/widget/listdatawidget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  dbperwalian dbPerwalian = dbperwalian();
  List<Perwalian> perwalianList;
  Widget build(BuildContext context) {
    if(perwalianList == null) {
      perwalianList = List<Perwalian>();
    }
    return Scaffold(
        body: Column(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff3be9ff), Color(0xff2095f3)],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 15, 30, 25),
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                    Column(
                      children:<Widget>[
                        SizedBox(height: 65),
                        Text("Selamat Datang",
                            style: TextStyle(color: Colors.white, fontSize: 24)),
                        Text("Indriani, S.T., M.Eng.",
                            style: TextStyle(color: Colors.white, fontSize: 36)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: Column(
                children:<Widget>[
                  Text("Silahkan pilih mahasiswa :",
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                height: 400,
                width: 500,
                child: Center(
                    child: FutureBuilder(
                      future: loadList(),
                      builder: (context, snapshot) {
                        return perwalianList.length > 0? new ListPerwalian(perwalian: perwalianList):
                        Center(child:
                        Text('No data found, tap plus button to add!', style: Theme.of(context).textTheme.headline6));
                      },
                    )
                ),
              ),
            ),
            SizedBox(height: 20)
          ],
        )
    );
  }

  Future loadList() {
    final Future futureDB = dbPerwalian.initDB();
    return futureDB.then((db) {
      Future<List<Perwalian>> futurePerwalian = dbPerwalian.perwalian();
      futurePerwalian.then((perwalianList) {
        setState(() {
          this.perwalianList = perwalianList;
        });
      });
    });
  }
}