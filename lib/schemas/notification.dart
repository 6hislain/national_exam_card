import 'package:isar/isar.dart';
part 'notification.g.dart';

@Collection()
class Notifications {
  Id? id;

  String? title;
  String? url;
  String? content;
  DateTime? createdAt;

  @Index()
  late int userId;
}
