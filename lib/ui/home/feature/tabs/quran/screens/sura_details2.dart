import 'package:flutter/material.dart';
import 'package:islami/ui/home/feature/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';
import '../../../../../../core/utils/app_image.dart';
import '../../../../../../providers/most_recent_provider.dart';
import '../../../../network/model/utils/model_app.dart';
import '../widgets/text_style_item.dart';

class SuraDetails2 extends StatefulWidget {
  @override
  State<SuraDetails2> createState() => _SuraDetails2State();
}

class _SuraDetails2State extends State<SuraDetails2> {
  String Verse = '';
  List<String> Verses = [];
  bool nextDesign = false;
  late MostRecentProvider mostRecent;
  bool isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!isLoaded) {
      isLoaded = true;
      final args = ModalRoute.of(context)!.settings.arguments as int;
      loadSura(args);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
    mostRecent = Provider.of<MostRecentProvider>(context);

    int args = ModalRoute.of(context)?.settings.arguments as int;

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
              if (nextDesign == false) {
                nextDesign = true;
              } else {
                nextDesign = false;
              }
              setState(() {});
            },
            child: ImageIcon(AssetImage(AppImage.iconQuran)),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: width * 0.05),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
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
                horizontal: width * 0.04,
                vertical: height * 0.013,
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
                        padding: EdgeInsets.symmetric(vertical: height * 0.02),
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
                        return Container(height: height * 0.012);
                      },
                    ),
            ),
          ),
          Image.asset(AppImage.bottomImage),
        ],
      ),
    );
  }

  Future<void> loadSura(int index) async {
    final homeProvider = context.read<HomeProvider>();
    final verse = await homeProvider.loadSuraFile(index);
    final verses = await homeProvider.loadSuraFile2(index);
    if (!mounted) return;
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      Verse = verse;
      Verses = verses;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecent.getData();
  }
}
