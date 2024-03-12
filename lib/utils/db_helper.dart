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
          CREATE TABLE "users" (
            "id" integer not null primary key autoincrement,
            "name" varchar not null,
            "image" varchar,
            "email" varchar not null,
            "email_verified_at" datetime,
            "role" varchar check ("role" in ('student', 'staff', 'admin')) not null default 'student',
            "password" varchar not null,
            "remember_token" varchar,
            "deleted_at" datetime,
            "created_at" datetime,
            "updated_at" datetime
          );
          CREATE TABLE "subjects" (
            "id" integer not null primary key autoincrement,
            "name" varchar not null,
            "image" varchar,
            "description" text,
            "deleted_at" datetime,
            "created_at" datetime,
            "updated_at" datetime,
            "user_id" integer not null,
            foreign key ("user_id") references "users" ("id") on delete cascade
          );
          CREATE TABLE "schools" (
            "id" integer not null primary key autoincrement,
            "name" varchar not null,
            "contact" varchar not null,
            "image" varchar,
            "description" text,
            "deleted_at" datetime,
            "created_at" datetime,
            "updated_at" datetime,
            "user_id" integer not null,
            foreign key ("user_id") references "users" ("id") on delete cascade
          );
          CREATE TABLE "papers" (
            "id" integer not null primary key autoincrement,
            "name" varchar not null,
            "document" varchar,
            "description" text,
            "deleted_at" datetime,
            "created_at" datetime,
            "updated_at" datetime,
            "user_id" integer not null,
            "subject_id" integer not null,
            foreign key ("user_id") references "users" ("id") on delete cascade,
            foreign key ("subject_id") references "subjects" ("id") on delete cascade
          );
          CREATE TABLE "notifications" (
            "id" integer not null primary key autoincrement,
            "title" varchar not null,
            "url" varchar,
            "content" text,
            "deleted_at" datetime,
            "created_at" datetime,
            "updated_at" datetime,
            "user_id" integer not null,
            foreign key ("user_id") references "users" ("id") on delete cascade
          );
          CREATE TABLE "marks" (
            "id" integer not null primary key autoincrement,
            "marks" integer not null,
            "semester" integer not null,
            "year" integer not null,
            "deleted_at" datetime,
            "created_at" datetime,
            "updated_at" datetime,
            "user_id" integer not null,
            "subject_id" integer not null,
            "student_id" integer not null,
            foreign key ("user_id") references "users" ("id") on delete cascade,
            foreign key ("student_id") references "users" ("id") on delete cascade,
            foreign key ("subject_id") references "subjects" ("id") on delete cascade
          );
          CREATE TABLE "combinations" (
            "id" integer not null primary key autoincrement,
            "name" varchar not null,
            "image" varchar,
            "description" text,
            "deleted_at" datetime,
            "created_at" datetime,
            "updated_at" datetime,
            "user_id" integer not null,
            foreign key ("user_id") references "users" ("id") on delete cascade
          );
          CREATE TABLE "calendar_events" (
            "id" integer not null primary key autoincrement,
            "name" varchar not null,
            "stop" datetime not null,
            "start" datetime not null,
            "color" varchar,
            "description" text,
            "deleted_at" datetime,
            "created_at" datetime,
            "updated_at" datetime,
            "user_id" integer not null,
            foreign key ("user_id") references "users" ("id") on delete cascade
          );
          CREATE TABLE "applications" (
            "id" integer not null primary key autoincrement,
            "first_name" varchar not null,
            "last_name" varchar not null,
            "gender" varchar check ("gender" in ('male', 'female', 'other')) not null default 'other',
            "status" varchar not null default 'pending',
            "city" varchar,
            "father" varchar,
            "mother" varchar,
            "nationality" varchar,
            "contact_person" varchar,
            "contact_details" varchar,
            "image" varchar,
            "description" text,
            "dob" date not null,
            "approved" tinyint (1) not null default '0',
            "deleted_at" datetime,
            "created_at" datetime,
            "updated_at" datetime,
            "user_id" integer not null,
            "school_id" integer not null,
            "combination_id" integer not null,
            foreign key ("user_id") references "users" ("id") on delete cascade,
            foreign key ("school_id") references "schools" ("id") on delete cascade,
            foreign key ("combination_id") references "combinations" ("id") on delete cascade
          );
          CREATE TABLE "messages" (
            "id" integer not null primary key autoincrement,
            "content" text,
            "deleted_at" datetime,
            "created_at" datetime,
            "updated_at" datetime,
            "sender_id" integer not null,
            "receiver_id" integer not null,
            foreign key ("sender_id") references "users" ("id") on delete cascade,
            foreign key ("receiver_id") references "users" ("id") on delete cascade
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
