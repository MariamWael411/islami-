import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';
import '../../../../domain/entities/response/reciters/reciters.dart';

class RecitersItem extends StatelessWidget {
  RecitersItem({super.key, required this.reciter});

  Reciters reciter;

  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      margin: EdgeInsets.symmetric(vertical: height * 0.02),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,

            margin: EdgeInsets.only(left: width * 0.02),
            width: width * 0.21,
            height: height * 0.1,
            decoration: BoxDecoration(
              color: AppColor.black,
              borderRadius: BorderRadius.circular(50),
              border: GradientBoxBorder(
                width: 3,
                gradient: LinearGradient(
                  colors: [AppColor.lightGrediant, AppColor.darkGrediant],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            child: Text(reciter.letter ?? '', style: AppFont.primary38Bold),
          ),
          Column(
            spacing: height * 0.01,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.5,
                child: Text(reciter.name ?? '', style: AppFont.blackBold25),
              ),
              SizedBox(
                width: width * 0.5,
                child: Text(
                  " روايه ${reciter.moshaf![0].name ?? ''}",
                  style: AppFont.blackArMed18,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward_ios, color: AppColor.brown),
          ),
        ],
      ),
    );
  }
}
