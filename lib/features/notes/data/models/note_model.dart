import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  String date;
  @HiveField(3)
  int color;
  @HiveField(4)
  bool isEdited;

  NoteModel(
      {required this.title,
      required this.content,
      required this.date,
      required this.color,
      this.isEdited = false
      });
}
