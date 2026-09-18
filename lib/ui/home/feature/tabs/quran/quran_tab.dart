import 'package:flutter/material.dart';
import 'package:islami/cach/most_recent_cach.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';
import '../../../../../../core/utils/app_image.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/utils/app_string.dart';
import '../../../network/model/utils/model_app.dart';
import '../../provider/home_provider.dart';
import 'widgets/most_recent_widget.dart';


class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> suraIndex = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(width * 0.03),
        child: Column(
          spacing: height * 0.02,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              onChanged: (text) {
                final homeProvider = context.read<HomeProvider>();
                setState(() {
                  suraIndex = homeProvider.searchBySuraIndex(text);
                });
              },
              cursorColor: AppColor.white,
              style: AppFont.whiteBold16,
              decoration: InputDecoration(
                hintText: AppString.suraName,
                hintStyle: AppFont.whiteBold16,
                prefixIcon: ImageIcon(
                  AssetImage(AppImage.iconQuran),
                  color: AppColor.primaryColor,
                ),
                enabledBorder: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
              ),
            ),
            MostRecentWidget(),
            Text(AppString.suraList, style: AppFont.whiteBold16),
            suraIndex.isEmpty
                ? Center(
              child: Text(AppString.noResult, style: AppFont.primaryBold24),
            )
                : ListView.separated(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  InkWell(
                    onTap: () {
                      saveData(suraIndex[index]);
                      Navigator.of(context).pushNamed(
                        AppRoute.suraScreen2,
                        arguments: suraIndex[index],
                      );
                    },
                    child: Row(
                      spacing: width * 0.05,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(AppImage.ayaImage),
                            Text(
                              '${suraIndex[index] + 1}',
                              style: AppFont.whiteBold20,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ModelApp
                                    .englishQuranSurahs[suraIndex[index]],
                                style: AppFont.whiteBold20,
                              ),
                              Text(
                                '${ModelApp
                                    .AyaNumber[suraIndex[index]]} ${AppString
                                    .verses}',
                                style: AppFont.whiteBold14,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          ModelApp.arabicAuranSuras[suraIndex[index]],
                          style: AppFont.whiteBold20,
                        ),
                      ],
                    ),
                  ),
              separatorBuilder: (context, index) =>
                  Divider(
                    thickness: 2,
                    indent: width * 0.1,
                    endIndent: width * 0.1,
                    height: height * 0.04,
                  ),
              itemCount: suraIndex.length,
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
    );
  }


}
