import 'package:isar/isar.dart';

import 'application.dart';
part 'school.g.dart';

@Collection()
class School {
  Id? id;

  String? name;
  String? contact;
  String? image;
  String? description;
  DateTime? createdAt;

  @Index()
  late int userId;

  final applications = IsarLinks<Application>();
}
