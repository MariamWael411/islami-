import 'package:flutter/material.dart';
import 'package:islami/assets/app_routes.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:provider/provider.dart';

import '../../../assets/app_color.dart';
import '../../../assets/app_font.dart';
import '../../../assets/app_image.dart';
import '../../../assets/app_string.dart';
import '../../../model/model_app.dart';
import '../../home.dart';

class MostRecentWidget extends StatefulWidget {
  const MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostRecentProvider mostRecent;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mostRecent.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    mostRecent = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecent.mostRecentList.isNotEmpty,
      child: Column(
        spacing: height(context) * 0.01,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppString.mostRecently, style: AppFont.whiteBold16),
          Container(
            height: height(context) * 0.17,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoute.suraScreen2,
                    arguments: mostRecent.mostRecentList[index],
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width(context) * 0.03,
                    vertical: height(context) * 0.01,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.primaryColor,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            ModelApp.englishQuranSurahs[mostRecent
                                .mostRecentList[index]],
                            style: AppFont.blackBold24,
                          ),
                          Text(
                            ModelApp.arabicAuranSuras[mostRecent
                                .mostRecentList[index]],
                            style: AppFont.blackBold24,
                          ),
                          Text(
                            "${ModelApp.AyaNumber[mostRecent.mostRecentList[index]]}  ${AppString.verses}",
                            style: AppFont.blackBold14,
                          ),
                        ],
                      ),
                      Image.asset(AppImage.mostRecently),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) =>
                  Container(width: width(context) * 0.03),
              itemCount: mostRecent.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
