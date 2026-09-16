import 'package:flutter/material.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/ui/home.dart';

class ContainerAzkar extends StatelessWidget {
  ContainerAzkar({super.key, required this.image, required this.text});

  String image;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height(context) * 0.014),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(20),
        color: AppColor.black,
      ),
      child: Column(
        spacing: height(context) * 0.01,
        children: [
          Image.asset(image),
          Text(text, style: AppFont.whiteBold20),
        ],
      ),
    );
  }
}
