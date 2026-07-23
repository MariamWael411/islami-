import 'package:flutter/material.dart';

class TextStyleItem extends StatelessWidget {
  String text;
  TextStyle style;

  TextStyleItem({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );
  }
}
