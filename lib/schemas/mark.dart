import 'package:isar/isar.dart';
part 'mark.g.dart';

@Collection()
class Mark {
  Id? id;

  int? marks;
  int? semester;
  int? year;
  DateTime? createdAt;

  @Index()
  late int userId;

  @Index()
  late int subjectId;

  @Index()
  late int studentId;
}
