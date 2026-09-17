import 'package:flutter/material.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/assets/app_image.dart';
import 'package:islami/assets/app_routes.dart';
import 'package:islami/assets/app_string.dart';
import 'package:islami/model/azar_model.dart';
import 'package:islami/ui/home.dart';
import 'package:islami/ui/tabs/time/container_azkar.dart';
import 'package:islami/ui/tabs/time/time_container.dart';

class TimeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
        child: Column(
          spacing: height(context) * 0.04,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TimeContainer(),
            Text(AppString.azkar, style: AppFont.whiteDarkBold16),
            Row(
              spacing: width(context) * 0.04,
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: AzarModel.loadAzkarContent('أذكار المساء'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<AzarModel> azar = snapshot.data ?? [];
                        return InkWell(
                          onTap: () {
                            Navigator.of(
                              context,
                            ).pushNamed(AppRoute.azkzarScreen, arguments: azar);
                          },
                          child: ContainerAzkar(
                            image: AppImage.eveningAzkar,
                            text: AppString.eveningAzkar,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                            style: AppFont.primaryBold20,
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primaryColor,
                          ),
                        );
                      }
                    },
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: AzarModel.loadAzkarContent('أذكار الصباح'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<AzarModel> azar = snapshot.data ?? [];
                        return InkWell(
                          onTap: () {
                            Navigator.of(
                              context,
                            ).pushNamed(AppRoute.azkzarScreen, arguments: azar);
                          },
                          child: ContainerAzkar(
                            image: AppImage.morningAzkar,
                            text: AppString.morningAzkar,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                            style: AppFont.primaryBold20,
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primaryColor,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
