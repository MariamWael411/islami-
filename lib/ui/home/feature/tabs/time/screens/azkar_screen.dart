import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';
import '../../../../domain/entities/response/azkar/azar_model.dart';
import '../widgets/azkar_item.dart';

class AzkarScreen extends StatelessWidget {
  AzkarScreen({super.key});

  late List<AzarModel> args;

  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
    args = ModalRoute.of(context)?.settings.arguments as List<AzarModel>;
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        title: Text(args[0].category ?? "", style: AppFont.primaryBold25Amiri),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp),
          color: AppColor.primaryColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: (index % 2 == 0)
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    children: [
                      AzkarItem(azarModel: args[index]),
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.transparent,

                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.015,
                            horizontal: width * 0.047,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColor.lightAzarColor,
                                AppColor.darkAzarColor,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),

                          child: Text(
                            textAlign: TextAlign.center,
                            '${index + 1}.',
                            style: AppFont.blackBold20,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: args.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
