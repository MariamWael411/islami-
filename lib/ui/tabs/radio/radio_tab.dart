import 'package:flutter/material.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/assets/app_string.dart';
import 'package:islami/ui/home.dart';
import 'package:islami/ui/tabs/radio/radio_details_screen.dart';
import 'package:islami/ui/tabs/radio/reciters_details_screen.dart';
import 'package:islami/ui/tabs/radio/text_button_widget.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(context) * 0.03),
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
                : RecitersDetailsScreen(),
          ),
        ],
      ),
    );
  }
}
