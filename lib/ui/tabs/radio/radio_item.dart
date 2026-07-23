import 'package:flutter/material.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/assets/app_image.dart';
import 'package:islami/assets/app_string.dart';
import 'package:islami/model/model_app.dart';
import 'package:islami/ui/home.dart';

class RadioItem extends StatefulWidget {
  int index;
  String radio;

  RadioItem({
    super.key,
    required this.index,
    this.radio = AppString.labelRadio,
  });

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isSelected == false) {
          isSelected = true;
        } else {
          isSelected = false;
        }
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height(context) * 0.03),
        margin: EdgeInsets.only(bottom: height(context) * 0.02),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage((isSelected) ? AppImage.runDec : AppImage.mosque),
            alignment: AlignmentGeometry.bottomCenter,
          ),
        ),
        child: Column(
          spacing: height(context) * 0.04,
          children: [
            Text(
              "${widget.radio} ${ModelApp.readerNames[widget.index]}",
              style: AppFont.blackBold20,
            ),
            Row(
              spacing: width(context) * 0.05,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset((isSelected) ? AppImage.pause : AppImage.stop),
                Image.asset((isSelected) ? AppImage.mute : AppImage.listen),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
