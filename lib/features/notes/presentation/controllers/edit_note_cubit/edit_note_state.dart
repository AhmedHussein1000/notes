part of 'edit_note_cubit.dart';

@immutable
sealed class EditNoteState {}

final class EditNoteInitial extends EditNoteState {}

final class EditNoteLoading extends EditNoteState {}

final class EditNoteSuccess extends EditNoteState {
  final NoteModel noteModel;

  EditNoteSuccess({required this.noteModel});
}

final class EditNoteFailure extends EditNoteState {
  final String errorMessage;
  EditNoteFailure({required this.errorMessage});
}
