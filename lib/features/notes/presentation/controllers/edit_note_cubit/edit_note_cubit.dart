import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/notes/data/models/note_model.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());

  editNote({required NoteModel note, required NoteModel updatedNote}) async {
    try {
      emit(EditNoteLoading());
      note.title = updatedNote.title;
      note.content = updatedNote.content;
      note.color = updatedNote.color;
      note.date = updatedNote.date;
      note.isEdited = true;

      await note.save();
      emit(EditNoteSuccess(noteModel: note));
    } catch (e) {
      log('error in update note ${e.toString()}');
      emit(EditNoteFailure(
          errorMessage: 'Could not edit note, please try again'));
    }
  }
}
