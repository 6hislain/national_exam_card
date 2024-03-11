import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'data.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE "bible_version_key" (
            "id" INTEGER NOT NULL,
            "table" TEXT NOT NULL,
            "abbreviation" TEXT NOT NULL,
            "language" TEXT NOT NULL,
            "version" TEXT NOT NULL,
            "info_text" TEXT NOT NULL,
            "info_url" TEXT NOT NULL,
            "publisher" TEXT NOT NULL,
            "copyright" TEXT NOT NULL,
            "copyright_info" TEXT NOT NULL,
            PRIMARY KEY ("id")
          );
          CREATE TABLE "book_info" (
            "order" INTEGER NOT NULL,
            "title_short" TEXT NOT NULL,
            "title_full" TEXT NOT NULL,
            "abbreviation" TEXT NOT NULL,
            "category" TEXT NOT NULL,
            "otnt" TEXT NOT NULL,
            "chapters" INTEGER NULL,
            PRIMARY KEY ("order"),
            UNIQUE INDEX "book_info_title_short" ("title_short"),
            UNIQUE INDEX "book_info_title_full" ("title_full"),
            UNIQUE INDEX "book_info_order" ("order"),
            UNIQUE INDEX "book_info_abbreviation" ("abbreviation")
          );
          CREATE TABLE "t_asv" (
            "id" INTEGER NOT NULL,
            "b" INTEGER NOT NULL,
            "c" INTEGER NOT NULL,
            "v" INTEGER NOT NULL,
            "t" TEXT NOT NULL,
            PRIMARY KEY ("id"),
            UNIQUE INDEX "t_asv_id" ("id")
          );
          CREATE TABLE "t_bbe" (
            "id" INTEGER NOT NULL,
            "b" INTEGER NOT NULL,
            "c" INTEGER NOT NULL,
            "v" INTEGER NOT NULL,
            "t" TEXT NOT NULL,
            PRIMARY KEY ("id"),
            UNIQUE INDEX "t_bbe_id" ("id")
          );
          CREATE TABLE "t_kjv" (
            "id" INTEGER NOT NULL,
            "b" INTEGER NOT NULL,
            "c" INTEGER NOT NULL,
            "v" INTEGER NOT NULL,
            "t" TEXT NOT NULL,
            PRIMARY KEY ("id"),
            UNIQUE INDEX "t_kjv_id" ("id")
          );
          CREATE TABLE "t_web" (
            "id" INTEGER NOT NULL,
            "b" INTEGER NOT NULL,
            "c" INTEGER NOT NULL,
            "v" INTEGER NOT NULL,
            "t" TEXT NOT NULL,
            PRIMARY KEY ("id"),
            UNIQUE INDEX "t_web_id" ("id")
          );
          CREATE TABLE "t_ylt" (
            "id" INTEGER NOT NULL,
            "b" INTEGER NOT NULL,
            "c" INTEGER NOT NULL,
            "v" INTEGER NOT NULL,
            "t" TEXT NOT NULL,
            PRIMARY KEY ("id"),
            UNIQUE INDEX "t_ylt_id" ("id")
          );
          CREATE TABLE "prayers" (
            "id" INTEGER NOT NULL,
            "title" TEXT NOT NULL,
            "content" TEXT,
            PRIMARY KEY ("id"),
            UNIQUE INDEX "prayers_title_unique" ("id")
          );
          CREATE TABLE "hymns" (
            "id" INTEGER NOT NULL,
            "title" TEXT NOT NULL,
            "lyrics" TEXT,
            PRIMARY KEY ("id"),
            UNIQUE INDEX "hymns_title_unique" ("id")
          );
        ''');
      },
    );
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    Database? db = await database;
    return await db!.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> get(String table) async {
    Database? db = await database;
    return await db!.query(table);
  }

  Future<int> delete(String table, int id) async {
    Database? db = await database;
    return await db!.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
