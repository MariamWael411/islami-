import 'package:flutter/material.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/model/model_app.dart';
import 'package:islami/model/reciters.dart';
import 'package:islami/ui/home.dart';
import 'package:islami/ui/tabs/radio/radio_item.dart';

class ReciterSoundDetailsScreen extends StatelessWidget {
  ReciterSoundDetailsScreen({super.key});

  late Reciters reciters;

  @override
  Widget build(BuildContext context) {
    reciters = ModalRoute.of(context)?.settings.arguments as Reciters;
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp),
          color: AppColor.primaryColor,
        ),
        title: Text(reciters.name ?? '', style: AppFont.primaryBold25Amiri),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.04),
        child: Column(
          children: [
            SizedBox(height: height(context) * 0.02),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final number = (index + 1).toString().padLeft(3, '0');
                  return RadioItem(
                    index: index,
                    text: ModelApp.arabicAuranSuras[index],
                    url: "${reciters.moshaf![0].server}$number.mp3",
                  );
                },
                itemCount: ModelApp.arabicAuranSuras.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
