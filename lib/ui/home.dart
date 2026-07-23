import 'package:flutter/material.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/assets/app_image.dart';
import 'package:islami/assets/app_string.dart';
import 'package:islami/ui/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/ui/tabs/quran/quran_tab.dart';
import 'package:islami/ui/tabs/radio/radio_tab.dart';
import 'package:islami/ui/tabs/sebha/sebha_tab.dart';
import 'package:islami/ui/tabs/time/time_tab.dart';

double width(BuildContext context) => MediaQuery.of(context).size.width;

double height(BuildContext context) => MediaQuery.of(context).size.height;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    AppImage.backgroundQuran,
    AppImage.backgroundHadeth,
    AppImage.backgroundSebha,
    AppImage.backgroundRadio,
    AppImage.backgroundTime,
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          images[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            spacing: height(context) * 0.03,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: width(context) * 0.15,
                  right: width(context) * 0.15,
                  top: height(context) * 0.03,
                ),
                child: Image.asset(AppImage.imageHeader),
              ),
              Expanded(child: tabs[selectedIndex]),
            ],
          ),

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;

              setState(() {});
            },
            selectedLabelStyle: AppFont.whiteBold12,

            selectedItemColor: AppColor.white,
            unselectedItemColor: AppColor.black,
            backgroundColor: AppColor.primaryColor,
            showUnselectedLabels: false,

            type: BottomNavigationBarType.fixed,
            items: [
              bottomNavigationIten(AppImage.iconQuran, AppString.labelQuran, 0),
              bottomNavigationIten(
                AppImage.iconHadeth,
                AppString.labelHadeth,
                1,
              ),
              bottomNavigationIten(AppImage.iconSebha, AppString.labelSebha, 2),
              bottomNavigationIten(AppImage.iconRadio, AppString.labelRadio, 3),
              bottomNavigationIten(AppImage.iconTime, AppString.labelTime, 4),
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem bottomNavigationIten(
    String icon,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: (selectedIndex == index)
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColor.blackAlpha,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: ImageIcon(AssetImage(icon)),
            )
          : ImageIcon(AssetImage(icon)),
      label: label,
    );
  }
}
