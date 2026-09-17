import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islami/core/manage_sound/manage_sound.dart';
import 'package:islami/core/network/api/api_client.dart';
import 'package:islami/core/time_format/time_format.dart';
import 'package:islami/ui/tabs/time/time_item_widget.dart';

import '../../../assets/app_color.dart';
import '../../../assets/app_font.dart';
import '../../../assets/app_image.dart';
import '../../home.dart';

class TimeContainer extends StatefulWidget {
  const TimeContainer({super.key});

  @override
  State<TimeContainer> createState() => _TimeContainerState();
}

class _TimeContainerState extends State<TimeContainer> {
  Future? prayerFuture;
  bool isPlay = false;
  Timer? timer;
  Duration? remaining;

  @override
  void initState() {
    super.initState();
    prayerFuture = ApiClient.getPrey();
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
    return FutureBuilder(
      future: prayerFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
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
              horizontal: width(context) * 0.06,
              vertical: height(context) * 0.01,
            ),
            height: height(context) * 0.3,
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
                            .date!.gregorian!.month!.en!.substring(0, 4)},',
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
                        Text('${data.data!.date!.hijri!.day} ${data.data!.date!
                            .hijri!.month!.en!.substring(0, 8)},'
                            , style: AppFont.whiteBold16),
                        Text(data.data!.date!.hijri!.year ?? "",
                            style: AppFont.whiteBold16)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height(context) * 0.02),
                CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder:
                      (BuildContext context, int itemIndex,
                      int pageViewIndex) =>
                      TimeItemWidget(time: prayTime[itemIndex] ?? "",
                        prayName: prayName[itemIndex],),
                  options: CarouselOptions(
                    height: height(context) * 0.14,
                    viewportFraction: 0.35,
                    initialPage: 2,
                    enlargeCenterPage: true,
                  ),
                ),
                SizedBox(height: height(context) * 0.01),
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
                          final now = DateFormat('hh:mm').format(DateTime
                              .now());
                          if (isPlay && prayTime.contains(now.toString())) {
                            ManageSound.playSound('assets/adan/adan.mp3');
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
        }
        else if (snapshot.hasError) {
          return Center(child: Text(
            snapshot.error.toString(), style: AppFont.primaryBold20,),);
        } else {
          return SizedBox(
            height: height(context) * 0.25,
            child: Center(child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),),
          );
        }
      },
    );

  }
}
