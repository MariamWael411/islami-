import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';

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
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
    return TextButton(
      onPressed: widget.onClick,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: (widget.isSelected) ? _container(width, height) : _text(),
    );
  }

  Text _text() {
    return Text(widget.text, style: AppFont.whiteW40016);
  }

  AnimatedContainer _container(double width, double height) {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.13,
        vertical: height * 0.01,
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
