import 'package:flutter/material.dart';
import 'package:notes/features/notes/data/models/note_model.dart';
import 'package:notes/features/notes/presentation/screens/widgets/notes_screen_widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key, required this.notes,  });
  final List<NoteModel> notes;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      padding: const EdgeInsets.only(top: 20),
      itemBuilder: (context, index) => NoteItem(noteModel: notes[index] ,),
      itemCount: notes.length,
    );
  }
}
