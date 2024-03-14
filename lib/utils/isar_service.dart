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
      return await Isar.open([
        ApplicationSchema,
        CalendarEventSchema,
        CombinationSchema,
        MarkSchema,
        MessageSchema,
        NotificationsSchema,
        PaperSchema,
        SchoolSchema,
        SubjectSchema,
        UserSchema
      ],
          directory: (await getApplicationDocumentsDirectory()).path,
          inspector: true,
          name: 'necams');
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

  // START: school
  Future<int> saveSchool(School newSchool) async {
    final isar = await db;
    return isar.writeTxnSync<int>(() => isar.schools.putSync(newSchool));
  }

  Future<List<School>> getSchools({int offset = 0, int limit = 10}) async {
    final isar = await db;
    return await isar.schools.where().offset(offset).limit(limit).findAll();
  }

  Future<bool> deleteSchool(int id) async {
    final isar = await db;
    return isar.writeTxnSync<bool>(() => isar.schools.deleteSync(id));
  }

  // START: combination
  Future<int> saveCombination(Combination newCombination) async {
    final isar = await db;
    return isar
        .writeTxnSync<int>(() => isar.combinations.putSync(newCombination));
  }

  Future<List<Combination>> getCombinations(
      {int offset = 0, int limit = 10}) async {
    final isar = await db;
    return await isar.combinations
        .where()
        .offset(offset)
        .limit(limit)
        .findAll();
  }

  Future<bool> deleteCombination(int id) async {
    final isar = await db;
    return isar.writeTxnSync<bool>(() => isar.combinations.deleteSync(id));
  }

  // START: paper
  Future<int> savePaper(Paper newPaper) async {
    final isar = await db;
    return isar.writeTxnSync<int>(() => isar.papers.putSync(newPaper));
  }

  Future<List<Paper>> getPapers({int offset = 0, int limit = 10}) async {
    final isar = await db;
    return await isar.papers.where().offset(offset).limit(limit).findAll();
  }

  Future<bool> deletePaper(int id) async {
    final isar = await db;
    return isar.writeTxnSync<bool>(() => isar.papers.deleteSync(id));
  }

  // START: application
  Future<int> saveApplication(Application newApplication) async {
    final isar = await db;
    return isar
        .writeTxnSync<int>(() => isar.applications.putSync(newApplication));
  }

  Future<List<Application>> getApplications(
      {int offset = 0, int limit = 10}) async {
    final isar = await db;
    return await isar.applications
        .where()
        .offset(offset)
        .limit(limit)
        .findAll();
  }

  Future<bool> deleteApplication(int id) async {
    final isar = await db;
    return isar.writeTxnSync<bool>(() => isar.applications.deleteSync(id));
  }

  // START: calendar event
  Future<int> saveCalendarEvent(CalendarEvent newCalendarEvent) async {
    final isar = await db;
    return isar
        .writeTxnSync<int>(() => isar.calendarEvents.putSync(newCalendarEvent));
  }

  Future<List<CalendarEvent>> getCalendarEvents(
      {int offset = 0, int limit = 10}) async {
    final isar = await db;
    return await isar.calendarEvents
        .where()
        .offset(offset)
        .limit(limit)
        .findAll();
  }

  Future<bool> deleteCalendarEvent(int id) async {
    final isar = await db;
    return isar.writeTxnSync<bool>(() => isar.calendarEvents.deleteSync(id));
  }

  // START: marks
  Future<int> saveMark(Mark newMark) async {
    final isar = await db;
    return isar.writeTxnSync<int>(() => isar.marks.putSync(newMark));
  }

  Future<List<Mark>> getMarks({int offset = 0, int limit = 10}) async {
    final isar = await db;
    return await isar.marks.where().offset(offset).limit(limit).findAll();
  }

  Future<bool> deleteMark(int id) async {
    final isar = await db;
    return isar.writeTxnSync<bool>(() => isar.marks.deleteSync(id));
  }

  // START: notification
  Future<int> saveNotification(Notifications newNotification) async {
    final isar = await db;
    return isar
        .writeTxnSync<int>(() => isar.notifications.putSync(newNotification));
  }

  Future<List<Notifications>> getNotifications(
      {int offset = 0, int limit = 10}) async {
    final isar = await db;
    return await isar.notifications
        .where()
        .offset(offset)
        .limit(limit)
        .findAll();
  }

  Future<bool> deleteNotification(int id) async {
    final isar = await db;
    return isar.writeTxnSync<bool>(() => isar.notifications.deleteSync(id));
  }
}
