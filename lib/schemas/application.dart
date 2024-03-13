import 'package:isar/isar.dart';
part 'application.g.dart';

@Collection()
class Application {
  Id? id;

  String? firstName;
  String? lastName;
  String? gender;
  String? status;
  String? city;
  String? father;
  String? mother;
  String? nationality;
  String? contactPerson;
  String? contactDetails;
  String? image;
  String? description;
  DateTime? dob;
  bool? approved;
  DateTime? createdAt;

  @Index()
  late int userId;

  @Index()
  late int schoolId;

  @Index()
  late int combinationId;
}
