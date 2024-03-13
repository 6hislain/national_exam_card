import 'package:isar/isar.dart';

import 'mark.dart';
import 'application.dart';
import 'calendar_event.dart';
part 'user.g.dart';

@Collection()
class User {
  Id? id;
  String? name;
  String? image;
  String? email;
  DateTime? emailVerifiedAt;
  String? role;
  String? password;
  String? rememberToken;
  DateTime? createdAt;

  final marks = IsarLinks<Mark>();
  final applications = IsarLinks<Application>();
  final calendarEvents = IsarLinks<CalendarEvent>();
}
