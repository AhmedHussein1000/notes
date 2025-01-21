import 'package:flutter/material.dart';
import 'package:notes/core/themes/app_colors.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.deepRedPrimaryColor,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
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
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 18 ,fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))));

OutlineInputBorder _customOutlineInputBorder({Color? borderColor}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: borderColor ?? Colors.black.withAlpha((0.5 * 255).toInt())));
}
