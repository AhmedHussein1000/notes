import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/core/helpers/extensions.dart';
import 'package:notes/core/utils/constants.dart';
import 'package:notes/features/notes/presentation/controllers/edit_note_cubit/edit_note_cubit.dart';
import 'package:notes/features/notes/data/models/note_model.dart';
import 'package:notes/features/notes/presentation/screens/widgets/color_item.dart';
import 'package:notes/features/notes/presentation/screens/widgets/edit_note_widgets/edit_note_app_bar.dart';
import 'package:notes/features/notes/presentation/screens/widgets/edit_note_widgets/edit_note_form.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  late final TextEditingController titleController;
  late final TextEditingController contentController;
  final GlobalKey<FormState> _formKey = GlobalKey();
  late int colorIndex;
  @override
  void initState() {
    titleController = TextEditingController(text: widget.noteModel.title);
    contentController = TextEditingController(text: widget.noteModel.content);
    super.initState();
    colorIndex = AppConstants.notesBackgroundColorsValues
        .indexOf(widget.noteModel.color);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: EditNoteAppBar(
              onPressed: () {
                _formKey.currentState!.save();
                NoteModel updatedNote = NoteModel(
                    title: titleController.text,
                    content: contentController.text,
                    date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    color:
                        AppConstants.notesBackgroundColorsValues[colorIndex]);
                context
                    .read<EditNoteCubit>()
                    .editNote(note: widget.noteModel, updatedNote: updatedNote);
              },
            ),
          ),
          const SizedBox(height: 20),
          EditNoteForm(
            formKey: _formKey,
            titleController: titleController,
            contentController: contentController,
            onsavedTitle: (value) {
              if (value.isNullOrEmpty()) {
                titleController.text = widget.noteModel.title;
              } else {
                titleController.text = value!;
              }
            },
            onsavedContent: (value) {
              if (value.isNullOrEmpty()) {
                contentController.text = widget.noteModel.content;
              } else {
                contentController.text = value!;
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          StatefulBuilder(
            builder: (context, setState) => SizedBox(
              height: 72,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 5,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      colorIndex = index;
                      setState(() {});
                    },
                    child: ColorItem(
                        noteColorValue:
                            AppConstants.notesBackgroundColorsValues[index],
                        isSelected: colorIndex == index),
                  );
                },
                itemCount: AppConstants.notesBackgroundColorsValues.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
