// import 'package:flutter/material.dart';
// import 'package:notes/features/notes/data/models/note_model.dart';
// import 'package:notes/features/notes/presentation/screens/widgets/notes_screen_widgets/notes_list_bloc_builder.dart';
// import 'package:notes/features/notes/presentation/screens/widgets/notes_screen_widgets/notes_list_view.dart';

// class AllNotesOrSearchedNotes extends StatelessWidget {
//   const AllNotesOrSearchedNotes({super.key, required this.isSearching, required this.searchedNotes});
//   final bool isSearching;
//   final List<NoteModel> searchedNotes;
//   @override
//   Widget build(BuildContext context) {
//     return isSearching
//         ? Expanded(child: NotesListView(notes: searchedNotes))
//         : const NotesListBlocBuilder();
//   }
// }
