import 'package:isar/isar.dart';
part 'paper.g.dart';

@Collection()
class Paper {
  Id? id;

  String? name;
  String? document;
  String? description;
  DateTime? createdAt;

  @Index()
  late int userId;

  @Index()
  late int subjectId;
}
