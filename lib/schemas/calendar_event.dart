import 'package:isar/isar.dart';
part 'calendar_event.g.dart';

@Collection()
class CalendarEvent {
  Id? id;

  String? name;
  DateTime? stop;
  DateTime? start;
  String? color;
  String? description;
  DateTime? createdAt;

  @Index()
  late int userId;
}
