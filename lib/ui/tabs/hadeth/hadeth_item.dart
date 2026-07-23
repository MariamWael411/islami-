import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/assets/app_routes.dart';
import 'package:islami/model/hadeth_index.dart';
import 'package:islami/ui/tabs/quran/text_style_item.dart';

import '../../../assets/app_color.dart';
import '../../../assets/app_image.dart';
import '../../../model/hadeth.dart';
import '../../home.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoute.hadethScreen,
          arguments: HadethIndex(hadeth: hadeth!, index: widget.index),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.primaryColor,
          image: DecorationImage(
            image: AssetImage(AppImage.hadethDecorationCard),
          ),
        ),
        margin: EdgeInsets.only(
          top: height(context) * 0.03,
          bottom: height(context) * 0.04,
        ),

        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height(context) * 0.01),
              child: Image.asset(
                AppImage.hadethDecoration,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            hadeth == null
                ? Center(
                    child: CircularProgressIndicator(color: AppColor.black),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: width(context) * 0.14,
                      horizontal: width(context) * 0.05,
                    ),
                    child: Column(
                      spacing: height(context) * 0.03,
                      children: [
                        TextStyleItem(
                          text: hadeth!.title,
                          style: AppFont.blackBold24,
                        ),
                        Expanded(
                          child: TextStyleItem(
                            text: hadeth!.content,
                            style: AppFont.blackBold16,
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void loadFile() async {
    String fileContent = await rootBundle.loadString(
      'assets/hadeth/h${widget.index + 1}.txt',
    );
    int pattern = fileContent.indexOf('\n');
    String title = fileContent.substring(0, pattern);
    String content = fileContent.substring(pattern + 1);
    hadeth = Hadeth(title: title, content: content);
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
