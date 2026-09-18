import 'package:flutter/material.dart';
import 'package:islami/core/di/di.dart';
import 'package:islami/ui/home/feature/common/widget/main_error_widget.dart';
import 'package:islami/ui/home/feature/common/widget/main_loading_widget.dart';
import 'package:islami/ui/home/feature/provider/home_provider.dart';
import 'package:islami/ui/home/feature/tabs/time/widgets/time_container.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_font.dart';
import '../../../../../../core/utils/app_image.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/utils/app_string.dart';
import '../../../domain/entities/response/azkar/azar_model.dart';
import 'widgets/container_azkar.dart';


class TimeTab extends StatefulWidget {
  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  HomeProvider homeProvider = getIt();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeProvider.loadAzar('أذكار المساء');
    homeProvider.loadMorningAzar('أذكار الصباح');
  }
  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          spacing: height * 0.04,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TimeContainer(),
            Text(AppString.azkar, style: AppFont.whiteDarkBold16),
            Row(
              spacing: width * 0.04,
              children: [
                Expanded(
                  child: ChangeNotifierProvider(
                    create: (context) => homeProvider,
                    child: Consumer<HomeProvider>(
                      builder: (context, provider, child) {
                        if (provider.apiAzkar.isSuccess) {
                          List<AzarModel> azar = provider.apiAzkar.data ?? [];
                          return InkWell(
                            onTap: () {
                              Navigator.of(
                                context,
                              ).pushNamed(
                                  AppRoute.azkzarScreen, arguments: azar);
                            },
                            child: ContainerAzkar(
                              image: AppImage.eveningAzkar,
                              text: AppString.eveningAzkar,
                            ),
                          );
                        } else if (provider.apiAzkar.isError) {
                          return MainErrorWidget(
                              error: provider.apiAzkar.errorMessage ?? "");
                        } else {
                          return MainLoadingWidget();
                        }
                      },
                    ),

                  ),
                ),
                Expanded(
                  child: ChangeNotifierProvider(
                    create: (context) => homeProvider,
                    child: Consumer<HomeProvider>(
                      builder: (context, provider, child) {
                        if (provider.apiMorningAzkar.isSuccess) {
                          List<AzarModel> azar = provider.apiMorningAzkar
                              .data ?? [];
                          return InkWell(
                            onTap: () {
                              Navigator.of(
                                context,
                              ).pushNamed(
                                  AppRoute.azkzarScreen, arguments: azar);
                            },
                            child: ContainerAzkar(
                              image: AppImage.morningAzkar,
                              text: AppString.morningAzkar,
                            ),
                          );
                        } else if (provider.apiMorningAzkar.isError) {
                          return MainErrorWidget(
                              error: provider.apiMorningAzkar.errorMessage ??
                                  "");
                        } else {
                          return MainLoadingWidget();
                        }
                      },
                    ),

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

/*FutureBuilder(
                    future: AzarModelDto.loadAzkarContent('أذكار الصباح'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<AzarModelDto> azar = snapshot.data ?? [];
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
                  )*/


/*FutureBuilder(
                    future: AzarModelDto.loadAzkarContent('أذكار المساء'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<AzarModelDto> azar = snapshot.data ?? [];
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
                  )*/