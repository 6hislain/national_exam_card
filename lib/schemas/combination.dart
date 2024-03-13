import 'package:isar/isar.dart';

import 'application.dart';

part 'combination.g.dart';

@Collection()
class Combination {
  Id? id;

  String? name;
  String? image;
  String? description;
  DateTime? createdAt;

  @Index()
  late int userId;

  final applications = IsarLinks<Application>();
}
