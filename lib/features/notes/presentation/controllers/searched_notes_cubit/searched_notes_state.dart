part of 'searched_notes_cubit.dart';

@immutable
sealed class SearchedNotesState {}

final class SearchedNotesInitial extends SearchedNotesState {}
final class GetSearchedNotesLoaded extends SearchedNotesState {
  final List<NoteModel> searchedNotes;

  GetSearchedNotesLoaded({required this.searchedNotes});
}

final class NoNotesToSearch extends SearchedNotesState {
  final String message;

  NoNotesToSearch({required this.message});
}