import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/home.dart';
import 'package:islami/ui/tabs/hadeth/hadeth_item.dart';

class HadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            HadethItem(index: itemIndex),
        options: CarouselOptions(
          height: height(context) * 0.8,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
