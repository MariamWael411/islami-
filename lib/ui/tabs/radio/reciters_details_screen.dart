import 'package:flutter/material.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/assets/app_routes.dart';
import 'package:islami/core/network/api/api_client.dart';
import 'package:islami/model/Reciters_responce.dart';
import 'package:islami/ui/home.dart';
import 'package:islami/ui/tabs/radio/reciters_item.dart';

class RecitersDetailsScreen extends StatelessWidget {
  RecitersDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RecitersResponce>(future: ApiClient.getReciters(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              SizedBox(height: height(context) * 0.015,),
              Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) =>
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  AppRoute.recitersDetailsScreen,
                                  arguments: snapshot.data!.reciters![index]);
                            },
                            child: RecitersItem(
                              reciter: snapshot.data!.reciters![index],)),
                    itemCount: snapshot.data!.reciters!.length,
                  )
              )
            ],
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