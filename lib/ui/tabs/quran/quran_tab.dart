import 'package:flutter/material.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/assets/app_image.dart';
import 'package:islami/assets/app_routes.dart';
import 'package:islami/assets/app_string.dart';
import 'package:islami/cach/most_recent_cach.dart';
import 'package:islami/model/model_app.dart';
import 'package:islami/ui/home.dart';
import 'package:islami/ui/tabs/quran/most_recent_widget.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> suraIndex = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(width(context) * 0.03),
        child: Column(
          spacing: height(context) * 0.02,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              onChanged: (text) {
                searchBySuraName(text);
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
                      spacing: width(context) * 0.05,
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
                    indent: width(context) * 0.1,
                    endIndent: width(context) * 0.1,
                    height: height(context) * 0.04,
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

  void searchBySuraName(String text) {
    List<int> search = [];
    for (int i = 0; i < ModelApp.englishQuranSurahs.length; i++) {
      if (ModelApp.englishQuranSurahs[i].toLowerCase().contains(
        text.toLowerCase(),
      )) {
        search.add(i);
      }
      if (ModelApp.arabicAuranSuras[i].contains(text)) {
        search.add(i);
      }
    }
    suraIndex = search;
    setState(() {});
  }
}
