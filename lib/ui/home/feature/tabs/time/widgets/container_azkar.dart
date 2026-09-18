import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';

class ContainerAzkar extends StatelessWidget {
  ContainerAzkar({super.key, required this.image, required this.text});

  String image;
  String text;

  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.014),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(20),
        color: AppColor.black,
      ),
      child: Column(
        spacing: height * 0.01,
        children: [
          Image.asset(image),
          Text(text, style: AppFont.whiteBold20),
        ],
      ),
    );
  }
}
