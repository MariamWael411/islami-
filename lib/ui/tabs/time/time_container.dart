import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/tabs/time/time_item_widget.dart';

import '../../../assets/app_color.dart';
import '../../../assets/app_font.dart';
import '../../../assets/app_image.dart';
import '../../home.dart';

class TimeContainer extends StatelessWidget {
  const TimeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width(context) * 0.06,
        vertical: height(context) * 0.01,
      ),
      height: height(context) * 0.3,
      decoration: BoxDecoration(
        color: AppColor.brown,
        borderRadius: BorderRadius.circular(40),
        image: DecorationImage(
          image: AssetImage(AppImage.timeContainer),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('16 Jul,\n 2024', style: AppFont.whiteBold16),
              Column(
                children: [
                  Text('Pray Time', style: AppFont.blackAlphaBold20),
                  Text('Tuesday', style: AppFont.blackAlpha2Bold20),
                ],
              ),
              Text('09 Muh,\n 1446', style: AppFont.whiteBold16),
            ],
          ),
          SizedBox(height: height(context) * 0.02),
          CarouselSlider.builder(
            itemCount: 5,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    TimeItemWidget(),
            options: CarouselOptions(
              height: height(context) * 0.14,
              viewportFraction: 0.35,

              initialPage: 2,

              enlargeCenterPage: true,
            ),
          ),
          SizedBox(height: height(context) * 0.01),
          Row(
            children: [
              Spacer(),
              Text('Next Pray ', style: AppFont.blackAlphaBold20),
              Text('- 02:32', style: AppFont.blackBold16),
              Spacer(),

              Image.asset(AppImage.mute2),
            ],
          ),
        ],
      ),
    );
  }
}
