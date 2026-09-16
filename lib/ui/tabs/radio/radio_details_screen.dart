import 'package:flutter/material.dart';
import 'package:islami/core/network/api/api_client.dart';
import 'package:islami/ui/tabs/radio/radio_item.dart';

import '../../../assets/app_color.dart';
import '../../../assets/app_font.dart';

class RadioDetailsScreen extends StatelessWidget {
  const RadioDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiClient.getRadio(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (context, index) =>
                RadioItem(index: index,
                  text: " إذاعه ${snapshot.data!.radios![index].name!} ",
                  url: snapshot.data!.radios![index].url ?? '',),
            itemCount: snapshot.data!.radios!.length,
          );
        } else if (snapshot.hasError) {
          return Center(child: Text(
            snapshot.error.toString(), style: AppFont.primaryBold20,),);
        } else {
          return Center(child: CircularProgressIndicator(
            color: AppColor.primaryColor,
          ),);
        }
      },);


  }
}
