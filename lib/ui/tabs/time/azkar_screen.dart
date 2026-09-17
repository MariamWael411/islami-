import 'package:flutter/material.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/model/azar_model.dart';
import 'package:islami/ui/home.dart';
import 'package:islami/ui/tabs/time/azkar_item.dart';

class AzkarScreen extends StatelessWidget {
  AzkarScreen({super.key});

  late List<AzarModel> args;

  @override
  Widget build(BuildContext context) {
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
          horizontal: width(context) * 0.04,
          vertical: height(context) * 0.02,
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
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: height(context) * 0.015,
                          horizontal: width(context) * 0.047,
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
