import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';

class TimeItemWidget extends StatelessWidget {
  TimeItemWidget({super.key, required this.time, required this.prayName});

  String prayName;
  String time;

  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
    DateTime dateTime = DateFormat("HH:mm").parse(time);
    String formattedTime = DateFormat("hh:mm ").format(dateTime);
    String period = DateFormat('a').format(dateTime);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
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
            Text(prayName, style: AppFont.whiteBold16),
            Text(formattedTime, style: AppFont.whiteBold32),
            Text(period, style: AppFont.whiteBold16),
          ],
        ),
      ),
    );
  }
}
