import 'package:flutter/material.dart';

import 'package:uas_adrian_mobile_programming/models/perwalian.dart';
import 'package:uas_adrian_mobile_programming/pages/user/detail_page.dart';

class ListPerwalian extends StatelessWidget {
  final List<Perwalian> perwalian;
  ListPerwalian({Key key, this.perwalian}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          itemCount: perwalian == null ? 0 : perwalian.length,
          itemBuilder: (BuildContext context, int index) {
            return
              Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPageAdmin(perwalian[index])),
                      );
                    },
                    child: ListTile(
                      title: Column(
                        children:<Widget>[
                          Text(perwalian[index].nama_mahasiswa),
                          Text(perwalian[index].npm.toString()),
                          Text(perwalian[index].status_perwalian, style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  )
              );
          });
  }
}
