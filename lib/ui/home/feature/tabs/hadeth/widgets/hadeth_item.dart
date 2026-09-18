import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';
import '../../../../../../core/utils/app_image.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../network/model/utils/hadeth.dart';
import '../../../../network/model/utils/hadeth_index.dart';
import '../../../provider/home_provider.dart';
import '../../quran/widgets/text_style_item.dart';

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
    loadHadeth();
  }

  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
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
          top: height * 0.03,
          bottom: height * 0.04,
        ),

        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.01),
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
                      vertical: width * 0.14,
                      horizontal: width * 0.05,
                    ),
                    child: Column(
                      spacing: height * 0.03,
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

  Future<void> loadHadeth() async {
    final provider = context.read<HomeProvider>();

    hadeth = await provider.loadHadth(widget.index);
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
