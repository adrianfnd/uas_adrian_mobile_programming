import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:uas_adrian_mobile_programming/models/perwalian.dart';


class dbperwalian {

  Database database;

  Future initDB() async {
    if (database != null) {
      return database;
    }

    String databasesPath = await getDatabasesPath();

    database = await openDatabase(
      join(databasesPath, 'perwalian.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE PERWALIAN(NO INTEGER PRIMARY KEY, NPM INTEGER, NAMA_MAHASISWA TEXT, ALAMAT TEXT, TOTAL_SKS INTEGER, STATUS_PERWALIAN TEXT)",
        );
      },
      version: 1,
    );

    return database;
  }

  void insertPerwalian(Perwalian perwalian) async {
    final Database db = database;

    db.insert(
      'perwalian',
      perwalian.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Perwalian>> perwalian() async {
    final Database db = database;

    final List<Map<String, dynamic>> maps = await db.query('perwalian');

    return List.generate(maps.length, (i) {
      return Perwalian(
        no: maps[i]['NO'],
        npm: maps[i]['NPM'],
        nama_mahasiswa: maps[i]['NAMA_MAHASISWA'],
        alamat: maps[i]['ALAMAT'],
        total_sks: maps[i]['TOTAL_SKS'],
        status_perwalian: maps[i]['STATUS_PERWALIAN'],
      );
    });
  }

  Future<void> updatePerwalian(Perwalian perwalian) async {
    final db = database;

    await db.update(
      'perwalian',
      perwalian.toMap(),
      where: "NO = ?",
      whereArgs: [perwalian.no],
    );
  }

  Future<void> deletePerwalian(int no) async {
    final db = database;

    await db.delete(
      'perwalian',
      where: "NO = ?",
      whereArgs: [no],
    );
  }
}