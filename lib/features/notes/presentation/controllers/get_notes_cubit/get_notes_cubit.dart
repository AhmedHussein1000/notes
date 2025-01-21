import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes/core/helpers/cache_helper.dart';
import 'package:notes/core/helpers/extensions.dart';
import 'package:notes/features/notes/data/models/note_model.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit() : super(GetNotesInitial());

  getNotes() {
    List<NoteModel>? notes =
        Hive.box<NoteModel>(CacheHelper.notesbox).values.toList();
    if (!notes.isNullOrEmpty()) {
      emit(GetNotesLoaded(notes: notes));
    } else {
      emit(NoNotes(message: 'There are no notes yet'));
    }
  }

}
