import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/functions/show_toast.dart';
import 'package:notes/core/helpers/extensions.dart';
import 'package:notes/core/widgets/custom_progress_indicator_hud.dart';
import 'package:notes/features/notes/data/models/note_model.dart';
import 'package:notes/features/notes/presentation/controllers/edit_note_cubit/edit_note_cubit.dart';
import 'package:notes/features/notes/presentation/screens/widgets/edit_note_widgets/edit_note_body.dart';

class EditNoteBodyBlocConsumer extends StatelessWidget {
  const EditNoteBodyBlocConsumer({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditNoteCubit, EditNoteState>(
      listener: (context, state) {
        if (state is EditNoteFailure) {
          customToast(message: state.errorMessage, state: ToastStates.error);
        }
        if (state is EditNoteSuccess) {
          context.pop();
        }
      },
      builder: (context, state) {
        return CustomProgressIndicatorHud(
          isLoading: state is EditNoteLoading,
          child: EditNoteBody(
            noteModel: noteModel,
          ),
        );
      },
    );
  }
}
