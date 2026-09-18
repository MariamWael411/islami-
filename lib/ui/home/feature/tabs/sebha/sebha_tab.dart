import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';
import '../../../../../../core/utils/app_image.dart';
import '../../../../../../core/utils/app_string.dart';
import '../../../network/model/utils/model_app.dart';

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
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.07),
      child: Column(
        spacing: height * 0.015,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppString.sebhaTitle,
            style: AppFont.whiteBold36,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.02),
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
              children: [
                Positioned(
                  top: -75,
                  left: width * 0.24,
                  bottom: height * 0.37,
                  child: Image.asset(AppImage.headerSebha),
                ),
                SizedBox(
                  height: height * 0.56,
                  child: Stack(
                    alignment: AlignmentGeometry.center,
                    children: [
                      Transform.rotate(
                        angle: angle,
                        alignment: Alignment.center,

                        child: Image.asset(AppImage.sebha),
                      ),
                      Positioned(
                        bottom: height * 0.18,
                        child: Column(
                          spacing: height * 0.05,
                          children: [
                            Text(
                              ModelApp.Azkar[index],
                              style: AppFont.whiteBold36,
                            ),
                            Text('$numberOfSebha', style: AppFont.whiteBold36),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
