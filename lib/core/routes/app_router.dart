import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/routes/routes.dart';
import 'package:notes/core/widgets/no_route_defined_screen.dart';
import 'package:notes/features/notes/data/models/note_model.dart';
import 'package:notes/features/notes/presentation/controllers/searched_notes_cubit/searched_notes_cubit.dart';
import 'package:notes/features/notes/presentation/screens/widgets/edit_note_widgets/edit_note_screen.dart';
import 'package:notes/features/notes/presentation/screens/notes_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.notes:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SearchedNotesCubit(),
            child: const NotesScreen(),
          ),
        );
      case Routes.editNote:
        NoteModel noteModel = arguments as NoteModel;
        return MaterialPageRoute(
          builder: (_) => EditNoteScreen(noteModel: noteModel),
        );

      default:
        return MaterialPageRoute(builder: (_) => const NoRouteDefinedScreen());
    }
  }
}
