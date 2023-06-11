import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String judul;

  @HiveField(1)
  String desc;

  @HiveField(2)
  String tag;

  @HiveField(3)
  bool status;

  NoteModel({
    required this.judul,
    required this.desc,
    required this.tag,
    required this.status,
  });
}
