import 'package:isar/isar.dart';
part 'message.g.dart';

@Collection()
class Message {
  Id? id;

  String? content;
  DateTime? createdAt;

  @Index()
  late int senderId;

  @Index()
  late int receiverId;
}
