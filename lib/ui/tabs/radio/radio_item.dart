import 'package:flutter/material.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/assets/app_image.dart';
import 'package:islami/providers/sound_manager_provider.dart';
import 'package:islami/ui/home.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatefulWidget {
  int index;
  String text;
  String url;


  RadioItem({

    super.key,
    required this.index,
    required this.text,
    required this.url
  });

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<SoundManagerProvider>(
      builder: (BuildContext context, radio, Widget? child) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: height(context) * 0.03),
          margin: EdgeInsets.only(bottom: height(context) * 0.02),
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(
                  (radio.currentUrl == widget.url && isPlaying) ? AppImage
                      .runDec : AppImage.mosque),
              alignment: AlignmentGeometry.bottomCenter,
            ),
          ),
          child: Column(
            spacing: height(context) * 0.04,
            children: [
              Text(
                widget.text,
                style: AppFont.blackBold20,
              ),
              Row(
                spacing: width(context) * 0.05,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {
                    //play sound
                    radio.play(widget.url);
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                      icon: Image.asset(
                          (radio.currentUrl == widget.url && isPlaying)
                              ? AppImage.pause
                              : AppImage.stop)),
                  IconButton(onPressed: () {
                    //stop
                    radio.stop(widget.url);
                  }, icon: Icon(Icons.stop, color: AppColor.black, size: 45,)),
                  IconButton(onPressed: () {
                    // mute
                    radio.mute(widget.url, radio.rate == 0 ? 1.0 : 0.0);
                  },
                      icon: Image.asset(
                          (radio.currentUrl == widget.url && radio.rate == 0)
                              ? AppImage.mute
                              : AppImage.listen)),
                ],
              ),
            ],
          ),
        );
      },

    );
  }
}
