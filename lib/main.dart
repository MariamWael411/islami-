import 'package:flutter/material.dart';
import 'package:islami/assets/app_routes.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:islami/providers/sound_manager_provider.dart';
import 'package:islami/ui/home.dart';
import 'package:islami/ui/introdation/onboardingScreen.dart';
import 'package:islami/ui/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami/ui/tabs/quran/sura_details2.dart';
import 'package:islami/ui/tabs/radio/radio_details_screen.dart';
import 'package:islami/ui/tabs/radio/reciter_sound_details_screen.dart';
import 'package:islami/ui/tabs/time/azkar_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => MostRecentProvider(),),
      ChangeNotifierProvider(create: (context) => SoundManagerProvider(),)
    ],
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.intro,
      routes: {
        AppRoute.home: (context) => Home(),
        AppRoute.intro: (context) => Onboardingscreen(),
        AppRoute.suraScreen2: (context) => SuraDetails2(),
        AppRoute.hadethScreen: (context) => HadethDetailsScreen(),
        AppRoute.radioDetailsScreen: (context) => RadioDetailsScreen(),
        AppRoute.recitersDetailsScreen: (context) =>
            ReciterSoundDetailsScreen(),
        AppRoute.azkzarScreen: (context) => AzkarScreen()
      },
    );
  }
}
