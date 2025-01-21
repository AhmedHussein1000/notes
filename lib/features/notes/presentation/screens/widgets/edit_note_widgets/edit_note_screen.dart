import 'package:flutter/material.dart';
import 'package:notes/features/notes/data/models/note_model.dart';
import 'package:notes/features/notes/presentation/screens/widgets/edit_note_widgets/edit_note_body_bloc_consumer.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: EditNoteBodyBlocConsumer(
        noteModel: noteModel,
      )),
    );
  }
}
