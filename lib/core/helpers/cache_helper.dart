import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/features/notes/data/models/note_model.dart';

abstract class CacheHelper {
  static const notesbox = 'notes_box';
  static Future<void> initialHive() async {
   await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(notesbox);
}
}