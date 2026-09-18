import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';
import '../../../../domain/entities/response/reciters/reciters.dart';
import '../../../../network/model/utils/model_app.dart';
import '../widgets/radio_item.dart';

class ReciterSoundDetailsScreen extends StatelessWidget {
  ReciterSoundDetailsScreen({super.key});

  late Reciters reciters;

  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
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
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
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
