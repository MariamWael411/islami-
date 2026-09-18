import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';
import '../../../../../../core/utils/app_image.dart';
import '../../../../../../core/utils/app_string.dart';
import '../../../../network/model/utils/hadeth_index.dart';
import '../../quran/widgets/text_style_item.dart';

class HadethDetailsScreen extends StatefulWidget {
  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);

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
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
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
                horizontal: width * 0.04,
                vertical: height * 0.013,
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
