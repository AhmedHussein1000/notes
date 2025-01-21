import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/core/helpers/extensions.dart';
import 'package:notes/core/routes/routes.dart';
import 'package:notes/core/themes/app_styles.dart';
import 'package:notes/features/notes/data/models/note_model.dart';
import 'package:notes/features/notes/presentation/controllers/edit_note_cubit/edit_note_cubit.dart';
import 'package:notes/features/notes/presentation/controllers/get_notes_cubit/get_notes_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditNoteCubit, EditNoteState>(
      buildWhen: (previous, current) {
        if (current is EditNoteSuccess) {
          if (current.noteModel == noteModel) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.pushNamed(Routes.editNote, arguments: noteModel);
          },
          child: Container(
            padding: const EdgeInsetsDirectional.only(
                start: 16, bottom: 24, top: 24),
            decoration: BoxDecoration(
                color: Color(noteModel.color),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    noteModel.title,
                    style: Styles.styleRegular26(context)
                        .copyWith(color: Colors.black),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      noteModel.content,
                      style: Styles.styleRegular18(context).copyWith(
                          color: Colors.black.withAlpha((0.4 * 255).toInt())),
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        noteModel.delete();
                        context.read<GetNotesCubit>().getNotes();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.trash,
                        size: 20,
                        color: Color(0xFF252323),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                      noteModel.isEdited
                          ? 'last updated ${noteModel.date}'
                          : 'added ${noteModel.date}',
                      style: Styles.styleRegular16(context).copyWith(
                          color: Colors.black.withAlpha((0.4 * 255).toInt()))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
