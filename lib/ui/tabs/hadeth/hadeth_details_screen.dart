import 'package:flutter/material.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/assets/app_image.dart';
import 'package:islami/assets/app_string.dart';
import 'package:islami/model/hadeth_index.dart';
import 'package:islami/ui/home.dart';
import 'package:islami/ui/tabs/quran/text_style_item.dart';

class HadethDetailsScreen extends StatefulWidget {
  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    HadethIndex args =
        ModalRoute.of(context)?.settings.arguments as HadethIndex;

    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.primaryColor,
        title: Text(
          '${AppString.labelHadeth} ${args.index + 1}',
          style: AppFont.primaryBold20,
        ),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(context) * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImage.leftImage),
                Expanded(
                  child: Text(
                    '${args.hadeth.title}',
                    style: AppFont.primaryBold24,
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(AppImage.rightImage),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width(context) * 0.04,
                vertical: height(context) * 0.013,
              ),
              child: SingleChildScrollView(
                child: TextStyleItem(
                  text: args.hadeth.content,
                  style: AppFont.primaryBold20,
                ),
              ),
            ),
          ),
          Image.asset(AppImage.bottomImage),
        ],
      ),
    );
  }
}
