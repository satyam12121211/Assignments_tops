import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'notes_model.dart';

class SqfliteDatabase {
  static late Database _db;

  static Future<void> initialiseDatabase() async {
    Directory applicationDirectory = await getApplicationDocumentsDirectory();

    String databasePath = "${applicationDirectory.path}notes.db";

    _db = await openDatabase(databasePath, version: 1,
        onCreate: (db, version) async {
          await db.execute(
              'CREATE TABLE Notes (id INTEGER PRIMARY KEY, title TEXT, description TEXT, time INTEGER)');
        });
  }

  static Future<void> insertData(NotesModel model) async {
    final result = await _db.insert("Notes", model.toJson());
    print(result);
  }

  static Future<List<NotesModel>> getDataFromDatabase() async {
    final result = await _db.query("Notes");

    List<NotesModel> notesModel =
    result.map((e) => NotesModel.fromJson(e)).toList();

    return notesModel;
  }


  static Future<void> deleteDataFromDatabase(int time) async {
    final result =
    await _db.delete("Notes", where: "time = ?", whereArgs: [time]);

    print(result);
  }

  static Future<void> updateDataInDatabase(NotesModel model, int time) async {
    final result = await _db
        .update("Notes", model.toJson(), where: "time = ?", whereArgs: [time]);
    print(result);
  }
}