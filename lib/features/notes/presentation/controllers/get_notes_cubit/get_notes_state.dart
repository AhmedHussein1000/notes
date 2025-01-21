part of 'get_notes_cubit.dart';

@immutable
sealed class GetNotesState {}

final class GetNotesInitial extends GetNotesState {}

final class GetNotesLoaded extends GetNotesState {
  final List<NoteModel> notes;

  GetNotesLoaded({required this.notes});
}

final class NoNotes extends GetNotesState {
  final String message;

  NoNotes({required this.message});
}
