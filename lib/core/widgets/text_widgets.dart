import 'package:flutter/material.dart';

class TextWidgets extends StatelessWidget {
  const TextWidgets({super.key, required this.text, this.textStyle,  int? maxLines});
  final String text;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ?? TextStyle(fontSize: 16, color: Colors.black),
    );
  }
}
