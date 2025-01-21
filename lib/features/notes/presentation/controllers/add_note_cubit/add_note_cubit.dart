import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes/core/helpers/cache_helper.dart';
import 'package:notes/features/notes/data/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    var box = Hive.box<NoteModel>(CacheHelper.notesbox);
    try {
      await box.add(note);
      emit(AddNoteSuccess(message: 'Note added successfully'));
    } catch (e) {
      log('error in AddNoteCubit : ${e.toString()}');
      emit(AddNoteFailure(errorMessage: 'Failed to add note, try again'));
    }
  }
}
