import 'package:flutter/material.dart';

import 'package:uas_adrian_mobile_programming/database/db_perwalian.dart';
import 'package:uas_adrian_mobile_programming/models/perwalian.dart';

enum StatusPerwalian { Sudah_Perwalian, Belum_Perwalian }

class EditDataWidget extends StatefulWidget {
  EditDataWidget(this.perwalian);

  final Perwalian perwalian;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();

  dbperwalian dbPerwalian = dbperwalian();
  final _addFormKey = GlobalKey<FormState>();
  int _no;
  String statusPerwalian = 'Sudah_Perwalian';
  StatusPerwalian _status_perwalianController = StatusPerwalian.Sudah_Perwalian;
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
    statusPerwalian = widget.perwalian.status_perwalian;
    if(widget.perwalian.status_perwalian == 'Sudah Perwalian') {
      _status_perwalianController = StatusPerwalian.Sudah_Perwalian;
    } else {
      _status_perwalianController = StatusPerwalian.Belum_Perwalian;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('NPM'),
                              TextFormField(
                                controller: _npmController,
                                decoration: const InputDecoration(
                                  hintText: 'masukan npm',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Tolong masukan npm';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Nama Mahasiswa'),
                              TextFormField(
                                controller: _nama_mahasiswaController,
                                decoration: const InputDecoration(
                                  hintText: 'masukan nama mahasiswa',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Tolong masukan nama mahasiswa';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Alamat'),
                              TextFormField(
                                controller: _alamatController,
                                decoration: const InputDecoration(
                                  hintText: 'masukan alamat',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Tolong masukan alamat';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Total SKS'),
                              TextFormField(
                                controller: _total_sksController,
                                decoration: const InputDecoration(
                                  hintText: 'masukan total sks',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Tolong masukan total sks';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Status Perwalian'),
                              ListTile(
                                title: const Text('Sudah Perwalian'),
                                leading: Radio(
                                  value: StatusPerwalian.Sudah_Perwalian,
                                  groupValue: _status_perwalianController,
                                  fillColor:
                                  MaterialStateColor.resolveWith((states) => Colors.blueAccent),
                                  onChanged: (StatusPerwalian value) {
                                    setState(() {
                                      _status_perwalianController = value;
                                      statusPerwalian = 'Sudah Perwalian';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Belum Perwalian'),
                                leading: Radio(
                                  value: StatusPerwalian.Belum_Perwalian,
                                  groupValue: _status_perwalianController,
                                  fillColor:
                                  MaterialStateColor.resolveWith((states) => Colors.blueAccent),
                                  onChanged: (StatusPerwalian value) {
                                    setState(() {
                                      _status_perwalianController = value;
                                      statusPerwalian = 'Belum Perwalian';
                                    });
                                  },
                                ),
                              ),
                            ],
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
                                    if (_addFormKey.currentState.validate()) {
                                      _addFormKey.currentState.save();
                                      final initDB = dbPerwalian.initDB();
                                      initDB.then((db) async {
                                        await dbPerwalian.updatePerwalian(Perwalian(no: _no, npm: int.parse(_npmController.text), nama_mahasiswa: _nama_mahasiswaController.text, alamat: _alamatController.text, total_sks: int.parse(_total_sksController.text), status_perwalian: statusPerwalian));
                                      });

                                      Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                                    }
                                  },
                                  child: const Text('Edit Data')),
                            ],
                          ),
                        ),
                      ],
                    )
                )
            ),
          ),
        ),
      ),
    );
  }
}