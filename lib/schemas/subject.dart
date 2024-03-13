import 'package:isar/isar.dart';
part 'subject.g.dart';

@Collection()
class Subject {
  Id? id;

  String? name;
  String? image;
  String? description;
  DateTime? createdAt;

  @Index()
  late int userId;
}
