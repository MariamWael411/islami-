import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';
import '../../../../../../core/utils/app_image.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../home/network/model/utils/intro_model.dart';

class Onboardingscreen extends StatelessWidget {
  Onboardingscreen({super.key});



  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.15,
              vertical: height * 0.03,
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
              pages: IntroModel.introList().map((e) {
                return pageViewModel(e.title, e.body, e.image);
              }).toList(),
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
