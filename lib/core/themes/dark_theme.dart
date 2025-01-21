import 'package:flutter/material.dart';
import 'package:notes/core/themes/app_colors.dart';

ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: CircleBorder(),
      backgroundColor: AppColors.deepRedPrimaryColor,
      foregroundColor: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: _customOutlineInputBorder(),
        focusedBorder: _customOutlineInputBorder(),
        errorBorder: _customOutlineInputBorder(borderColor: Colors.red),
        focusedErrorBorder: _customOutlineInputBorder(borderColor: Colors.red)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.deepRedPrimaryColor,
            foregroundColor: Colors.black,
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))));

OutlineInputBorder _customOutlineInputBorder({Color? borderColor}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: borderColor ?? Colors.white.withAlpha((0.5 * 255).toInt())));
}
