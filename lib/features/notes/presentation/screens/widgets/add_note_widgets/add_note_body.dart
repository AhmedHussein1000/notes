import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/core/utils/constants.dart';
import 'package:notes/features/notes/data/models/note_model.dart';
import 'package:notes/features/notes/presentation/controllers/add_note_cubit/add_note_cubit.dart';
import 'package:notes/features/notes/presentation/screens/widgets/color_items_list.dart';
import 'package:notes/core/widgets/custom_button.dart';
import 'package:notes/core/widgets/custom_text_form_field.dart';

class AddNoteBody extends StatefulWidget {
  const AddNoteBody({super.key});

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  String? title;
  String? content;
  int colorIndex = 0;
  @override
  Widget build(BuildContext context) {
    log('bottom sheet rebuild');
    double bottomHeight = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: bottomHeight),
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                  width: 40,
                  height: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  )),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomTextField(
                      onsaved: (value) {
                        title = value;
                      },
                      hint: 'Title',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomTextField(
                      onsaved: (value) {
                        content = value;
                      },
                      hint: 'Content',
                      maxlines: 5,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ColorItemsList(
                onChanged: (index) => colorIndex = index,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(
                  onpressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      NoteModel noteModel = NoteModel(
                          title: title!,
                          content: content!,
                          date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                          color: AppConstants
                              .notesBackgroundColorsValues[colorIndex]);
                      context.read<AddNoteCubit>().addNote(noteModel);
                    }
                  },
                  buttonText: 'Add Note',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
