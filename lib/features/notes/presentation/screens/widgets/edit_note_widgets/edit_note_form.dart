import 'package:flutter/material.dart';
import 'package:notes/core/widgets/custom_text_form_field.dart';

class EditNoteForm extends StatelessWidget {
  const EditNoteForm({
    super.key,
    this.onsavedTitle,
    this.onsavedContent,
    required this.titleController,
    required this.contentController, required this.formKey,
  });

  final void Function(String?)? onsavedTitle, onsavedContent;
  final TextEditingController titleController, contentController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomTextField(
              controller: titleController,
              hint: 'title',
              onsaved: onsavedTitle,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              controller: contentController,
              hint: 'content',
              onsaved: onsavedContent,
              maxlines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
