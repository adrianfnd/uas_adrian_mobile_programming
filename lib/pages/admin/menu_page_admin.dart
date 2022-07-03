import 'package:flutter/material.dart';
import 'dart:async';

import 'package:uas_adrian_mobile_programming/models/perwalian.dart';
import 'package:uas_adrian_mobile_programming/database/db_perwalian.dart';
import 'package:uas_adrian_mobile_programming/pages/admin/widget/listdatawidget.dart';
import 'package:uas_adrian_mobile_programming/pages/admin/widget/adddatawidget.dart';

class MenuPageAdmin extends StatefulWidget {
  const MenuPageAdmin({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MenuPageAdminState createState() => _MenuPageAdminState();
}

class _MenuPageAdminState extends State<MenuPageAdmin> {
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
            Center(
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(100,16,100,16),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 14)),
                      onPressed: () {
                        _navigateToAddScreen(context);
                      },
                      child: const Text('Tambah Data')),
                ],
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

_navigateToAddScreen (BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddDataWidget()),
  );
}