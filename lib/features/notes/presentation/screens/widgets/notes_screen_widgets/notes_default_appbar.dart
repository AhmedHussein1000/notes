import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/core/themes/app_styles.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({
    super.key,
    required this.searchButtonOnPressed,
  });
  final void Function() searchButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Notes',
          style: Styles.styleBold24(context),
        ),
        IconButton(
          onPressed: searchButtonOnPressed,
          icon: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withAlpha((.08 * 255).toInt())),
            child: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
