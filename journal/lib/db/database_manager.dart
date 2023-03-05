import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/journal_entry.dart';
import 'journal_entry_dto.dart';

class DatabaseManager {
  static const String DB_NAME = "journal.sqlite3.db";
  static const String SCHEMA_SQL = "lib/assets/schema_1.sql.txt";
  static const String GET_SQL = "lib/assets/schema_2.sql.txt";
  static const String INSERT_SQL = "lib/assets/schema_3.sql.txt";

  static DatabaseManager? _instance;

  final Database? db;

  DatabaseManager._({required Database database}) : db = database;

  factory DatabaseManager.getInstance() {
    if (_instance == null) {
      initialize();
    }
    return _instance!;
  }

  static Future initialize() async {
    String schemaQuery = await rootBundle.loadString(SCHEMA_SQL);
    final dbPath = join(await getDatabasesPath(), DB_NAME);
    final db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        createTables(db, schemaQuery);
      },
    );
    _instance = DatabaseManager._(database: db);
    return _instance;
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  void saveJournalEntry({required JournalEntryValues dto}) {
    db!.transaction((txt) async {
      String insertQuery = await rootBundle.loadString(INSERT_SQL);
      await txt.rawInsert(
        insertQuery,
        [dto.title, dto.body, dto.rating, dto.date],
      );
    });
  }

  Future<List<JournalEntry>> journalEntries() async {
    String getQuery = await rootBundle.loadString(GET_SQL);
    final List<Map> dbEntry = await db!.rawQuery(getQuery);
    return List.generate(dbEntry.length, (i) {
      return JournalEntry(
        id: dbEntry[i]["id"],
        title: dbEntry[i]["title"],
        body: dbEntry[i]["body"],
        rating: dbEntry[i]["rating"],
        date: dbEntry[i]["date"],
      );
    });
  }
}
