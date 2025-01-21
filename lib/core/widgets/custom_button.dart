import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onpressed,
      required this.buttonText,
      this.height});
  final void Function() onpressed;
  final String buttonText;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onpressed,
        child: Text(buttonText),
      ),
    );
  }
}
