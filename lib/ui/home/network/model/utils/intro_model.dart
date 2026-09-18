import '../../../../../../core/utils/app_image.dart';

class IntroModel {
  String title;
  String body;
  String image;

  IntroModel({required this.title, required this.image, required this.body});

  static List<IntroModel> introList() {
    return [
      IntroModel(
        title: 'Welcome To Islmi App',
        image: AppImage.image1Intro,
        body: '',
      ),
      IntroModel(
        title: 'Welcome To Islami',
        image: AppImage.image2Intro,
        body: 'We Are Very Excited To Have You In Our Community',
      ),
      IntroModel(
        title: 'Reading the Quran',
        image: AppImage.image3Intro,
        body: 'Read, and your Lord is the Most Generous',
      ),
      IntroModel(
        title: 'Bearish',
        image: AppImage.image4Intro,
        body: 'Praise the name of your Lord, the Most High',
      ),
      IntroModel(
        title: 'Holy Quran Radio',
        image: AppImage.image5Intro,
        body:
            'You can listen to the Holy Quran Radio through the application for free and easily',
      ),
    ];
  }
}
