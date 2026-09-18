import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_config.dart';
import 'widgets/hadeth_item.dart';


class HadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
    return Center(
      child: CarouselSlider.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            HadethItem(index: itemIndex),
        options: CarouselOptions(
          height: height * 0.8,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
