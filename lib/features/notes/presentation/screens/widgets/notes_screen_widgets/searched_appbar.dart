import 'package:flutter/material.dart';
import 'package:notes/core/themes/app_colors.dart';

class SearchedAppBar extends StatelessWidget {
  const SearchedAppBar(
      {super.key,
      required this.onchanged,
      required this.arrowBackOnPressed,
      required this.clearButtonOnPressed,
      required this.searchController});
  final Function(String) onchanged;
  final Function() arrowBackOnPressed;
  final Function() clearButtonOnPressed;
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: arrowBackOnPressed,
            icon: const Icon(Icons.arrow_back_ios_new)),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: TextField(
            controller: searchController,
            cursorColor: AppColors.deepRedPrimaryColor,
            decoration: InputDecoration(
                hintText: 'Search by title',
                filled: true,
              
                fillColor: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade100
                    : Colors.grey.shade800,
                suffixIcon: IconButton(
                    onPressed: clearButtonOnPressed,
                    icon: const Icon(
                      Icons.clear,
                    ))),
            onChanged: onchanged,
          ),
        ),
      ],
    );
  }
}
