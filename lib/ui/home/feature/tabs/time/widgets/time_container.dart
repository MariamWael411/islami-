import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islami/core/di/di.dart';
import 'package:islami/core/manage_sound/manage_sound.dart';
import 'package:islami/core/time_format/time_format.dart';
import 'package:islami/ui/home/feature/common/widget/main_error_widget.dart';
import 'package:islami/ui/home/feature/common/widget/main_loading_widget.dart';
import 'package:islami/ui/home/feature/provider/home_provider.dart';
import 'package:islami/ui/home/feature/tabs/time/widgets/time_item_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';
import '../../../../../../core/utils/app_image.dart';

class TimeContainer extends StatefulWidget {
  const TimeContainer({super.key});

  @override
  State<TimeContainer> createState() => _TimeContainerState();
}

class _TimeContainerState extends State<TimeContainer> {
  Future? prayerFuture;
  HomeProvider homeProvider = getIt();
  bool isPlay = false;
  Timer? timer;
  Duration? remaining;

  @override
  void initState() {
    super.initState();
    homeProvider.loadTime();
    timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
    return ChangeNotifierProvider(
      create: (context) => homeProvider,
      child: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          if (homeProvider.apiTime.isSuccess) {
            var data = homeProvider.apiTime.data;
            List<String> prayTime = [
              data!.data!.timings!.fajr ?? '',
              data.data!.timings!.dhuhr ?? '',
              data.data!.timings!.asr ?? '',
              data.data!.timings!.maghrib ?? '',
              data.data!.timings!.isha ?? ''
            ];
            var prayName = [
              'FAJR',
              'DHUR',
              'ASR',
              'MAGHRIB',
              'ISHA'
            ];
            remaining = TimeFormat.nextPrey(prayTime);

            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.06,
                vertical: height * 0.01,
              ),
              height: height * 0.3,
              decoration: BoxDecoration(
                color: AppColor.brown,
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  image: AssetImage(AppImage.timeContainer),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(

                        children: [
                          Text('${data.data!.date!.gregorian!.day} ${data.data!
                              .date!.gregorian!.month!.en!.substring(0, 3)},',
                              style: AppFont.whiteBold16),
                          Text(data.data!.date!.gregorian!.year ?? "",
                              style: AppFont.whiteBold16)
                        ],
                      ),
                      Column(
                        children: [
                          Text('Pray Time', style: AppFont.blackAlphaBold20),
                          Text(data.data!.date!.hijri!.weekday!.en ?? "",
                              style: AppFont.blackAlpha2Bold20),
                        ],
                      ),
                      Column(
                        children: [
                          Text('${data.data!.date!.hijri!.day} ${data.data!
                              .date!
                              .hijri!.month!.en!.substring(0, 3)},'
                              , style: AppFont.whiteBold16),
                          Text(data.data!.date!.hijri!.year ?? "",
                              style: AppFont.whiteBold16)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder:
                        (BuildContext context, int itemIndex,
                        int pageViewIndex) =>
                        TimeItemWidget(time: prayTime[itemIndex] ?? "",
                          prayName: prayName[itemIndex],),
                    options: CarouselOptions(
                      height: height * 0.14,
                      viewportFraction: 0.35,
                      initialPage: 2,
                      enlargeCenterPage: true,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      Spacer(),
                      Text('Next Pray ', style: AppFont.blackAlphaBold20),
                      Text('- ${TimeFormat.formatDuration(remaining!)}',
                          style: AppFont.blackBold16),
                      Spacer(),

                      InkWell(
                          onTap: () {
                            isPlay = !isPlay;
                            final now = DateFormat('HH:mm').format(DateTime
                                .now());
                            print(now);
                            if (isPlay && prayTime.contains(now.toString())) {
                              ManageSound.playSound('assets/adan/adan2.mp3');
                            } else {
                              ManageSound.stopSound();
                            }
                            setState(() {

                            });
                          },
                          child: isPlay ? Icon(
                            Icons.volume_up_rounded, color: AppColor.black,
                            size: 30,) : Image.asset(AppImage.mute2)),
                    ],
                  ),
                ],
              ),
            );
          } else if (homeProvider.apiTime.isError) {
            return MainErrorWidget(
                error: homeProvider.apiTime.errorMessage ?? '');
          } else {
            return SizedBox(
                height: height * 0.26,
                child: MainLoadingWidget());
          }
        },
      ),
    );
  }
}
