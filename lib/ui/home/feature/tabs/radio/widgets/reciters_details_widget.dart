import 'package:flutter/material.dart';
import 'package:islami/core/di/di.dart';
import 'package:islami/ui/home/feature/common/widget/main_error_widget.dart';
import 'package:islami/ui/home/feature/common/widget/main_loading_widget.dart';
import 'package:islami/ui/home/feature/provider/home_provider.dart';
import 'package:islami/ui/home/feature/tabs/radio/widgets/reciters_item.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_routes.dart';


class RecitersDetailsWidget extends StatefulWidget {
  RecitersDetailsWidget({super.key});

  @override
  State<RecitersDetailsWidget> createState() => _RecitersDetailsWidgetState();
}

class _RecitersDetailsWidgetState extends State<RecitersDetailsWidget> {
  HomeProvider homeProvider = getIt();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeProvider.loadReciters();
  }
  @override
  Widget build(BuildContext context) {
    double width = AppConfig.width(context);

    double height = AppConfig.height(context);

    return ChangeNotifierProvider(
      create: (context) => homeProvider,
      child: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          if (homeProvider.apiReciters.isSuccess) {
            return Column(
              children: [
                SizedBox(height: height * 0.015,),
                Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) =>
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoute.recitersDetailsScreen,
                                    arguments: homeProvider.apiReciters.data!
                                        .reciters![index]);
                              },
                              child: RecitersItem(
                                reciter: homeProvider.apiReciters.data!
                                    .reciters![index],)),
                      itemCount: homeProvider.apiReciters.data!.reciters!
                          .length,
                    )
                )
              ],
            );
          } else if (homeProvider.apiReciters.isError) {
            return MainErrorWidget(
                error: homeProvider.apiReciters.errorMessage ?? '');
          } else {
            return MainLoadingWidget();
          }
        },

      ),
    );



  }
}