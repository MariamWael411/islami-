import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/assets/app_image.dart';
import 'package:islami/model/model_app.dart';
import 'package:islami/ui/home.dart';
import 'package:islami/ui/tabs/quran/text_style_item.dart';
import 'package:provider/provider.dart';

import '../../../providers/most_recent_provider.dart';

class SuraDetails2 extends StatefulWidget {
  @override
  State<SuraDetails2> createState() => _SuraDetails2State();
}

class _SuraDetails2State extends State<SuraDetails2> {
  String Verse = '';
  List<String> Verses = [];
  bool nextDesign = false;
  late MostRecentProvider mostRecent;

  @override
  Widget build(BuildContext context) {
    mostRecent = Provider.of<MostRecentProvider>(context);

    int args = ModalRoute.of(context)?.settings.arguments as int;
    if (Verses.isEmpty) {
      loadSuraFile(args);
      loadSuraFile2(args);
    }

    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.primaryColor,
        title: Text(
          '${ModelApp.englishQuranSurahs[args]}',
          style: AppFont.primaryBold20,
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              nextDesign = true;
              setState(() {});
            },
            child: ImageIcon(AssetImage(AppImage.iconQuran)),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: width(context) * 0.05),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(context) * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImage.leftImage),
                Text(
                  '${ModelApp.arabicAuranSuras[args]}',
                  style: AppFont.primaryBold24,
                ),
                Image.asset(AppImage.rightImage),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width(context) * 0.04,
                vertical: height(context) * 0.013,
              ),
              child: Verses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primaryColor,
                      ),
                    )
                  : nextDesign
                  ? SingleChildScrollView(
                      child: TextStyleItem(
                        text: Verse,
                        style: AppFont.primaryBold20,
                      ),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.symmetric(
                          vertical: height(context) * 0.02,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: AppColor.primaryColor,
                            width: 2,
                          ),
                        ),
                        child: TextStyleItem(
                          text: '${Verses[index]} [${index + 1}]',
                          style: AppFont.primaryBold20,
                        ),
                      ),
                      itemCount: Verses.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(height: height(context) * 0.012);
                      },
                    ),
            ),
          ),
          Image.asset(AppImage.bottomImage),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecent.getData();
  }

  Future<void> loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/utils/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[ ${i + 1} ]';
    }
    Verse = lines.join('');
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  Future<void> loadSuraFile2(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/utils/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    Verses = lines;
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
