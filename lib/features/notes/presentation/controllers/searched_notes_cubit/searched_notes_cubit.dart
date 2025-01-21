import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes/core/helpers/cache_helper.dart';
import 'package:notes/core/helpers/extensions.dart';
import 'package:notes/features/notes/data/models/note_model.dart';

part 'searched_notes_state.dart';

class SearchedNotesCubit extends Cubit<SearchedNotesState> {
  SearchedNotesCubit() : super(SearchedNotesInitial());

  getSearchedNotes({required String query}) {
    List<NoteModel>? notes =
        Hive.box<NoteModel>(CacheHelper.notesbox).values.toList();
    if (!notes.isNullOrEmpty()) {
      List<NoteModel> searchedNotes = [];
      if (query.isNotEmpty) {
        searchedNotes = notes
            .where((note) =>
                note.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        searchedNotes = [];
      }

      emit(GetSearchedNotesLoaded(searchedNotes: searchedNotes));
    } else {
      emit(NoNotesToSearch(message: 'There are no notes to search for'));
    }
  }
  void clearSearch() {
  emit(GetSearchedNotesLoaded(searchedNotes: const[]));
}
}
