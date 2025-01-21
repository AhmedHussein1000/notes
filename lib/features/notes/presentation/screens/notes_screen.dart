import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/notes/presentation/controllers/add_note_cubit/add_note_cubit.dart';
import 'package:notes/features/notes/presentation/screens/widgets/add_note_widgets/add_note.dart';
import 'package:notes/features/notes/presentation/screens/widgets/notes_screen_widgets/notes_screen_body.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            isDismissible: false,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
            context: context,
            builder: (context) => BlocProvider(
              create: (context) => AddNoteCubit(),
              child: const AddNote(),
            ),
          );
        },
        child: const Icon(
          Icons.note_add_outlined,
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: NotesScreenBody(),
        ),
      ),
    );
  }
}
