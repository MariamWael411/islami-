import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';
import '../../../../domain/entities/response/azkar/azar_model.dart';

class AzkarItem extends StatefulWidget {
  AzkarItem({super.key, required this.azarModel});

  AzarModel azarModel;

  @override
  State<AzkarItem> createState() => _AzkarItemState();
}

class _AzkarItemState extends State<AzkarItem> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.024),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        color: AppColor.bageColor,
        border: Border.all(color: AppColor.darkBage, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        spacing: height * 0.01,
        children: [
          Text(
            widget.azarModel.content ?? '',
            style: AppFont.blackBold25,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
          Divider(
            color: AppColor.darkBage,
            endIndent: width * 0.1,
            indent: width * 0.1,
          ),
          IconButton(
            onPressed: () {
              int azarCount = int.parse(widget.azarModel.count!);
              if (count == azarCount) {
                count = 0;
              } else {
                count++;
              }
              setState(() {});
            },
            icon: Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.013,
                horizontal: width * 0.026,
              ),
              decoration: BoxDecoration(
                color: AppColor.bageColor,
                border: Border.all(color: AppColor.darkBage, width: 4),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.add, color: AppColor.black, size: 27),
            ),
          ),
          Text(
            '$count / ${widget.azarModel.count}',
            style: AppFont.blackBold20,
          ),
        ],
      ),
    );
  }
}
