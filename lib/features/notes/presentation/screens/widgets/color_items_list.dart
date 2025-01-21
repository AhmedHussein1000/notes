import 'package:flutter/material.dart';
import 'package:notes/core/utils/constants.dart';
import 'package:notes/features/notes/presentation/screens/widgets/color_item.dart';

class ColorItemsList extends StatefulWidget {
  const ColorItemsList({super.key, required this.onChanged});
  final ValueChanged<int> onChanged;

  @override
  State<ColorItemsList> createState() => _ColorItemsListState();
}

class _ColorItemsListState extends State<ColorItemsList> {
  int colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
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
                widget.onChanged(colorIndex);
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
    );
  }
}
