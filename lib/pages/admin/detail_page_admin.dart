import 'package:flutter/material.dart';

import 'package:uas_adrian_mobile_programming/database/db_perwalian.dart';
import 'package:uas_adrian_mobile_programming/models/perwalian.dart';

import 'package:uas_adrian_mobile_programming/pages/admin/home_page_admin.dart';
import 'package:uas_adrian_mobile_programming/pages/admin/widget/editdatawidget.dart';

class DetailPageAdmin extends StatefulWidget {
  DetailPageAdmin(this.perwalian);

  final Perwalian perwalian;

  @override
  _DetailPageAdminState createState() => _DetailPageAdminState();
}

class _DetailPageAdminState extends State<DetailPageAdmin> {
  _DetailPageAdminState();

  dbperwalian dbPerwalian = dbperwalian();
  int _no;
  final _status_perwalianController = TextEditingController();
  final _npmController = TextEditingController();
  final _nama_mahasiswaController = TextEditingController();
  final _alamatController = TextEditingController();
  final _total_sksController = TextEditingController();

  @override
  void initState() {
    _no = widget.perwalian.no;
    _npmController.text = widget.perwalian.npm.toString();
    _nama_mahasiswaController.text = widget.perwalian.nama_mahasiswa;
    _alamatController.text = widget.perwalian.alamat;
    _total_sksController.text = widget.perwalian.total_sks.toString();
    _status_perwalianController.text = widget.perwalian.status_perwalian;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Perwalian',
            style: TextStyle(fontSize: 24)),
        leading: GestureDetector(
          onTap: () { /* Write listener code here */ },
          child: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            tooltip: 'Add new entry',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Center(
          child: Card(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: 370,
                  height: 725,
                  child: ListView(
                    children:<Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          SizedBox(height: 10),
                          Center(child: Text('Keterangan',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                          SizedBox(height: 50),
                          Row(
                            children:<Widget>[
                              Text('Nama',
                                  style: TextStyle(fontSize: 12)),
                              SizedBox(width: 79),
                              Text(':',
                                  style: TextStyle(fontSize: 12)),
                              SizedBox(width: 10),
                              Text(widget.perwalian.nama_mahasiswa.toString(),
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Divider(height: 10, thickness: 1, color: Colors.black26),
                          Row(
                            children:<Widget>[
                              Text('NPM',
                                  style: TextStyle(fontSize: 12)),
                              SizedBox(width: 86),
                              Text(':',
                                  style: TextStyle(fontSize: 12)),
                              SizedBox(width: 10),
                              Text(widget.perwalian.npm.toString(),
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Divider(height: 10, thickness: 1, color: Colors.black26),
                          Row(
                            children:<Widget>[
                              Text('Alamat',
                                  style: TextStyle(fontSize: 12)),
                              SizedBox(width: 74),
                              Text(':',
                                  style: TextStyle(fontSize: 12)),
                              SizedBox(width: 10),
                              Text(widget.perwalian.alamat.toString(),
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Divider(height: 10, thickness: 1, color: Colors.black26),
                          Row(
                            children:<Widget>[
                              Text('Status Perwalian',
                                  style: TextStyle(fontSize: 12)),
                              SizedBox(width: 23),
                              Text(':',
                                  style: TextStyle(fontSize: 12)),
                              SizedBox(width: 10),
                              Text(widget.perwalian.status_perwalian.toString(),
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Divider(height: 10, thickness: 1, color: Colors.black26),
                          Row(
                            children:<Widget>[
                              Text('Total SKS',
                                  style: TextStyle(fontSize: 12)),
                              SizedBox(width: 61),
                              Text(':',
                                  style: TextStyle(fontSize: 12)),
                              SizedBox(width: 10),
                              Text(widget.perwalian.total_sks.toString(),
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Divider(height: 10, thickness: 1, color: Colors.black26),
                          SizedBox(height: 120),
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
                                      _DialogPerwalian();
                                    },
                                    child: const Text('Perwalian')),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
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
                                        padding: const EdgeInsets.fromLTRB(104,16,104,16),
                                        primary: Colors.white,
                                        textStyle: const TextStyle(fontSize: 14)),
                                    onPressed: () {
                                      _navigateToEditScreen(context, widget.perwalian);
                                    },
                                    child: const Text('Edit Data')),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
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
                                        padding: const EdgeInsets.fromLTRB(96,16,96,16),
                                        primary: Colors.white,
                                        textStyle: const TextStyle(fontSize: 14)),
                                    onPressed: () {
                                      _DialogHapus();
                                    },
                                    child: const Text('Hapus Data')),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ],
                  )
              )
          )
      ),
    );
  }

  Future<void> _DialogPerwalian() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // admin must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Perhatian!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Apakah anda yakin ingin mengsahkan perwalian ini?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Iya'),
              onPressed: () {
                final initDB = dbPerwalian.initDB();
                initDB.then((db) async {
                  await dbPerwalian.updatePerwalian(Perwalian(no: _no, npm: int.parse(_npmController.text), nama_mahasiswa: _nama_mahasiswaController.text, alamat: _alamatController.text, total_sks: int.parse(_total_sksController.text), status_perwalian: "Sudah Perwalian"));
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeAdmin()),
                );
              },
            ),
            FlatButton(
              child: const Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _DialogHapus() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // admin must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Peringatan!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Apa kamu yakin akan menghapus data ini?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Iya'),
              onPressed: () {
                final initDB = dbPerwalian.initDB();
                initDB.then((db) async {
                  await dbPerwalian.deletePerwalian(widget.perwalian.no);
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeAdmin()),
                );
              },
            ),
            FlatButton(
              child: const Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _navigateToEditScreen (BuildContext context, Perwalian perwalian) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditDataWidget(perwalian)),
    );
  }

}