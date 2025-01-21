import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/themes/app_styles.dart';
import 'package:notes/features/notes/presentation/controllers/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes/features/notes/presentation/controllers/searched_notes_cubit/searched_notes_cubit.dart';
import 'package:notes/features/notes/presentation/screens/widgets/notes_screen_widgets/notes_list_view.dart';

class NotesListBlocBuilder extends StatelessWidget {
  const NotesListBlocBuilder({super.key, required this.isSearching});
  final bool isSearching;
  @override
  Widget build(BuildContext context) {
    return isSearching
        ? BlocBuilder<SearchedNotesCubit, SearchedNotesState>(
          
            builder: (context, state) {
              if (state is GetSearchedNotesLoaded) {
                return Expanded(
                    child: NotesListView(notes: state.searchedNotes));
              } else if (state is NoNotesToSearch) {
                return Expanded(
                    child: Center(
                        child: Text(
                  state.message,
                  style: Styles.styleSemiBold20(context),
                )));
              } else {
                return const SizedBox.shrink();
              }
            },
          )
        : BlocBuilder<GetNotesCubit, GetNotesState>(
            buildWhen: (previous, current) =>
                current is GetNotesLoaded || current is NoNotes,
            builder: (context, state) {
              
              if (state is GetNotesLoaded) {
                return Expanded(child: NotesListView(notes: state.notes));
              } else if (state is NoNotes) {
                return Expanded(
                    child: Center(
                        child: Text(
                  state.message,
                  style: Styles.styleSemiBold20(context),
                )));
              } else {
                return const SizedBox.shrink();
              }
            },
          );
  }
}
