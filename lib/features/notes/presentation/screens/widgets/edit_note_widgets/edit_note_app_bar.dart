import 'package:flutter/material.dart';
import 'package:notes/core/themes/app_styles.dart';

class EditNoteAppBar extends StatelessWidget {
  const EditNoteAppBar({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Edit Note',
          style: Styles.styleBold24(context),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.done,
          ),
        ),
      ],
    );
  }
}
