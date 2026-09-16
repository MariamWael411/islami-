import 'package:flutter/material.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/ui/home.dart';

import '../../../assets/app_font.dart';

typedef OnClick = void Function();

class TextButtonWidget extends StatefulWidget {
  String text;
  OnClick onClick;
  bool isSelected;

  TextButtonWidget({
    super.key,
    required this.text,
    required this.onClick,
    required this.isSelected,
  });

  @override
  State<TextButtonWidget> createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onClick,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: (widget.isSelected) ? _container() : _text(),
    );
  }

  Text _text() {
    return Text(widget.text, style: AppFont.whiteW40016);
  }

  AnimatedContainer _container() {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(
        horizontal: width(context) * 0.13,
        vertical: height(context) * 0.01,
      ),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      duration: Duration(milliseconds: 500),
      child: Text(widget.text, style: AppFont.blackW40016),
    );
  }
}
