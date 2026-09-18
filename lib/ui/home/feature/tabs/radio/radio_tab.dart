import 'package:flutter/material.dart';
import 'package:islami/ui/home/feature/tabs/radio/screens/radio_details_screen.dart';
import 'package:islami/ui/home/feature/tabs/radio/widgets/reciters_details_widget.dart';
import 'package:islami/ui/home/feature/tabs/radio/widgets/text_button_widget.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_string.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.blackAlpha2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButtonWidget(
                    text: AppString.labelRadio,
                    isSelected: selectedIndex == 0,
                    onClick: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextButtonWidget(
                    text: AppString.reciters,
                    isSelected: selectedIndex == 1,
                    onClick: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: selectedIndex == 0
                ? RadioDetailsScreen()
                : RecitersDetailsWidget(),
          ),
        ],
      ),
    );
  }
}
