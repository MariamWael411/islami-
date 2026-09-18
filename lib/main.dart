import 'package:flutter/material.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:islami/providers/sound_manager_provider.dart';
import 'package:islami/ui/home/feature/home.dart';
import 'package:islami/ui/home/feature/provider/home_provider.dart';
import 'package:islami/ui/home/feature/tabs/hadeth/screens/hadeth_details_screen.dart';
import 'package:islami/ui/home/feature/tabs/quran/screens/sura_details2.dart';
import 'package:islami/ui/home/feature/tabs/radio/screens/radio_details_screen.dart';
import 'package:islami/ui/home/feature/tabs/radio/screens/reciter_sound_details_screen.dart';
import 'package:islami/ui/home/feature/tabs/time/screens/azkar_screen.dart';
import 'package:islami/ui/introdation/onboardingScreen.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_routes.dart';
import 'core/di/di.dart';

void main() {
  configureDependencies();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => getIt<HomeProvider>()),
      ChangeNotifierProvider(create: (context) => MostRecentProvider(),),
      ChangeNotifierProvider(create: (context) => SoundManagerProvider()),
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
