import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/notes/presentation/controllers/searched_notes_cubit/searched_notes_cubit.dart';
import 'package:notes/features/notes/presentation/screens/widgets/notes_screen_widgets/notes_default_appbar.dart';
import 'package:notes/features/notes/presentation/screens/widgets/notes_screen_widgets/notes_list_bloc_builder.dart';
import 'package:notes/features/notes/presentation/screens/widgets/notes_screen_widgets/searched_appbar.dart';

class NotesScreenBody extends StatefulWidget {
  const NotesScreenBody({super.key});

  @override
  State<NotesScreenBody> createState() => _NotesScreenBodyState();
}

class _NotesScreenBodyState extends State<NotesScreenBody> {
  bool isSearching = false;
  late final TextEditingController searchController;
  Timer? _debounce;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<SearchedNotesCubit>().getSearchedNotes(query: query);
    });
  }

  @override
  Widget build(BuildContext context) {
    var searchCubit = context.read<SearchedNotesCubit>();
    return Column(
      children: [
        const SizedBox(height: 20),
        AnimatedCrossFade(
            firstChild: DefaultAppBar(
              searchButtonOnPressed: () {
                isSearching = true;
                setState(() {});
              },
            ),
            secondChild: SearchedAppBar(
                onchanged: (value) {
                  searchController.text = value;
                  _onSearchChanged(searchController.text);
                },
                arrowBackOnPressed: () {
                  isSearching = false;
                  setState(() {});
                  searchController.clear();
                  searchCubit.clearSearch();
                },
                clearButtonOnPressed: () {
                  searchController.clear();
                  searchCubit.clearSearch();
                },
                searchController: searchController),
            crossFadeState: isSearching
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 500)),
        NotesListBlocBuilder(
          isSearching: isSearching,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
