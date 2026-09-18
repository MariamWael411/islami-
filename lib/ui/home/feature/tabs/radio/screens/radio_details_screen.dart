import 'package:flutter/material.dart';
import 'package:islami/ui/home/feature/common/widget/main_error_widget.dart';
import 'package:islami/ui/home/feature/common/widget/main_loading_widget.dart';
import 'package:islami/ui/home/feature/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/di/di.dart';
import '../widgets/radio_item.dart';

class RadioDetailsScreen extends StatefulWidget {
  const RadioDetailsScreen({super.key});

  @override
  State<RadioDetailsScreen> createState() => _RadioDetailsScreenState();
}

class _RadioDetailsScreenState extends State<RadioDetailsScreen> {
  HomeProvider homeProvider = getIt();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeProvider.loadRadio();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => homeProvider,
      child: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
        if (homeProvider.apiRadio.isSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) =>
                RadioItem(index: index,
                  text: " إذاعه ${homeProvider.apiRadio.data!.radios![index]
                      .name!} ",
                  url: homeProvider.apiRadio.data!.radios![index].url ?? '',),
            itemCount: homeProvider.apiRadio.data!.radios!.length,
          );
        } else if (homeProvider.apiRadio.isError) {
          return MainErrorWidget(
              error: homeProvider.apiRadio.errorMessage ?? "");
        } else {
          return MainLoadingWidget();
        }
      },),
    );




  }
}
