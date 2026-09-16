import 'package:flutter/material.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/ui/home.dart';

class TimeItemWidget extends StatelessWidget {
  const TimeItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width(context) * 0.04,
        vertical: height(context) * 0.01,
      ),

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.black, AppColor.lightBrown],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ASR', style: AppFont.whiteBold16),
            Text('04:38', style: AppFont.whiteBold32),
            Text('PM', style: AppFont.whiteBold16),
          ],
        ),
      ),
    );
  }
}
