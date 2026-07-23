import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/assets/app_image.dart';
import 'package:islami/assets/app_routes.dart';

import '../home.dart';

class Onboardingscreen extends StatelessWidget {
  Onboardingscreen({super.key});

  List<String> titles = [
    'Welcome To Islmi App',
    'Welcome To Islami',
    'Reading the Quran',
    'Bearish',
    'Holy Quran Radio',
  ];

  List<String> bodys = [
    '',
    'We Are Very Excited To Have You In Our Community',
    'Read, and your Lord is the Most Generous',
    'Praise the name of your Lord, the Most High',
    'You can listen to the Holy Quran Radio through the application for free and easily',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width(context) * 0.15,
              vertical: height(context) * 0.03,
            ),
            child: Image.asset(AppImage.imageHeader),
          ),

          Expanded(
            child: IntroductionScreen(
              dotsDecorator: DotsDecorator(
                activeColor: AppColor.primaryColor,
                size: const Size(8.0, 8.0),
                activeSize: const Size(22.0, 8.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              pages: [
                pageViewModel(titles[0], bodys[0], AppImage.image1Intro),
                pageViewModel(titles[1], bodys[1], AppImage.image2Intro),
                pageViewModel(titles[2], bodys[2], AppImage.image3Intro),
                pageViewModel(titles[3], bodys[3], AppImage.image4Intro),
                pageViewModel(titles[4], bodys[4], AppImage.image5Intro),
              ],
              globalBackgroundColor: AppColor.black,
              done: Text('Finish', style: AppFont.primaryBold16),
              onDone: () {
                Navigator.of(context).pushNamed(AppRoute.home);
              },
              showBackButton: true,
              next: Text('Next', style: AppFont.primaryBold16),
              back: Text('Back', style: AppFont.primaryBold16),
            ),
          ),
        ],
      ),
    );
  }

  PageViewModel pageViewModel(String title, String body, String image) {
    return PageViewModel(
      titleWidget: Column(
        spacing: 70,
        children: [
          Image.asset(image),
          Text(title, style: AppFont.primaryBold24),
        ],
      ),
      body: body,
      decoration: PageDecoration(
        bodyTextStyle: AppFont.primaryBold20,
        bodyAlignment: Alignment.bottomCenter,
      ),
    );
  }
}
