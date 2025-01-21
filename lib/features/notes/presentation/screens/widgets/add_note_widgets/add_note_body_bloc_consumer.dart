import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes/core/functions/show_toast.dart';
import 'package:notes/core/helpers/extensions.dart';
import 'package:notes/core/widgets/custom_progress_indicator_hud.dart';
import 'package:notes/features/notes/presentation/controllers/add_note_cubit/add_note_cubit.dart';
import 'package:notes/features/notes/presentation/controllers/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes/features/notes/presentation/screens/widgets/add_note_widgets/add_note_body.dart';

class AddNoteBodyBlocConsumer extends StatelessWidget {
  const AddNoteBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(listener: (context, state) {
      if (state is AddNoteFailure) {
        customToast(message: state.errorMessage, state: ToastStates.error);
      }
      if (state is AddNoteSuccess) {
        customToast(
            message: state.message,
            state: ToastStates.success,
            toastLength: Toast.LENGTH_SHORT);
        context.read<GetNotesCubit>().getNotes();
        context.pop();
      }
    }, builder: (context, state) {
      return CustomProgressIndicatorHud(
        isLoading: state is AddNoteLoading,
        child: const AddNoteBody(),
      );
    });
  }
}
