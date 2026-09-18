import 'package:flutter/material.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';
import '../../../../../../core/utils/app_image.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/utils/app_string.dart';
import '../../../../network/model/utils/model_app.dart';

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
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
    mostRecent = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecent.mostRecentList.isNotEmpty,
      child: Column(
        spacing: height * 0.01,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppString.mostRecently, style: AppFont.whiteBold16),
          Container(
            height: height * 0.17,
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
                    horizontal: width * 0.03,
                    vertical: height * 0.01,
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
                  Container(width: width * 0.03),
              itemCount: mostRecent.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
