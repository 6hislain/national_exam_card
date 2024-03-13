import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../schemas/application.dart';
import '../schemas/calendar_event.dart';
import '../schemas/combination.dart';
import '../schemas/mark.dart';
import '../schemas/message.dart';
import '../schemas/notification.dart';
import '../schemas/paper.dart';
import '../schemas/school.dart';
import '../schemas/subject.dart';
import '../schemas/user.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          ApplicationSchema,
          CalendarEventSchema,
          CombinationSchema,
          MarkSchema,
          MessageSchema,
          NotificationSchema,
          PaperSchema,
          SchoolSchema,
          SubjectSchema,
          UserSchema
        ],
        directory: (await getApplicationDocumentsDirectory()).path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> cleanDB() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  // START: user
  Future<int> saveUser(User newUser) async {
    final isar = await db;
    return isar.writeTxnSync<int>(() => isar.users.putSync(newUser));
  }

  Future<User?> findUser({String email = ''}) async {
    final isar = await db;
    return await isar.users.filter().emailEqualTo(email).findFirst();
  }

  Future<List<User>> getUsers({int offset = 0, int limit = 10}) async {
    final isar = await db;
    return await isar.users.where().offset(offset).limit(limit).findAll();
  }

  Future<bool> deleteUser(int id) async {
    final isar = await db;
    return isar.writeTxnSync<bool>(() => isar.users.deleteSync(id));
  }

  // START: subject
  Future<int> saveSubject(Subject newSubject) async {
    final isar = await db;
    return isar.writeTxnSync<int>(() => isar.subjects.putSync(newSubject));
  }

  Future<List<Subject>> getSubjects({int offset = 0, int limit = 10}) async {
    final isar = await db;
    return await isar.subjects.where().offset(offset).limit(limit).findAll();
  }

  Future<bool> deleteSubject(int id) async {
    final isar = await db;
    return isar.writeTxnSync<bool>(() => isar.subjects.deleteSync(id));
  }
}
