import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem(
      {super.key, required this.noteColorValue, required this.isSelected});
  final int noteColorValue;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade600
                : Colors.white,
            radius: 36,
            child: CircleAvatar(
              backgroundColor: Color(noteColorValue),
              radius: 35,
              child: const Icon(
                Icons.done,
                size: 30,
                color: Colors.black38,
              ),
            ),
          )
        : CircleAvatar(
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade600
                : Colors.white,
            radius: 36,
            child: CircleAvatar(
              backgroundColor: Color(noteColorValue),
              radius: 35,
            ));
  }
}
