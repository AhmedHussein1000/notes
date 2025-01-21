import 'package:flutter/material.dart';
import 'package:notes/core/themes/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.maxlines = 1,
      this.validator,
      this.onsaved,
      this.controller,
      this.onchanged});
  final String hint;
  final int maxlines;
  final String? Function(String?)? validator;
  final void Function(String?)? onsaved;
  final TextEditingController? controller;
  final Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      controller: controller,
      onSaved: onsaved,
      validator: validator ??
          (value) {
            if (value == '' || value == null) {
              return "This field can't be empty.";
            } else {
              return null;
            }
          },
      maxLines: maxlines,
      cursorColor: AppColors.deepRedPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}
