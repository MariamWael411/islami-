import 'package:flutter/material.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/assets/app_image.dart';
import 'package:islami/assets/app_string.dart';
import 'package:islami/model/model_app.dart';
import 'package:islami/ui/home.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int numberOfSebha = 0;
  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: height(context) * 0.015,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppString.sebhaTitle,
          style: AppFont.whiteBold36,
          textAlign: TextAlign.center,
        ),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,

          onTap: () {
            angle += 1;
            numberOfSebha++;
            int i = 0;
            if (numberOfSebha == 34) {
              numberOfSebha = 0;
              if (index == 3) {
                index = 0;
              } else {
                index++;
              }
            }
            setState(() {});
          },
          child: Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Column(
                children: [
                  Image.asset(AppImage.headerSebha),
                  Transform.rotate(
                    angle: angle,
                    alignment: Alignment.center,

                    child: Image.asset(AppImage.sebha),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: height(context) * 0.1),
                  child: Column(
                    spacing: height(context) * 0.05,
                    children: [
                      Text(ModelApp.Azkar[index], style: AppFont.whiteBold36),
                      Text('$numberOfSebha', style: AppFont.whiteBold36),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
