import 'package:flutter/material.dart';
import 'package:islami/model/model_app.dart';
import 'package:islami/ui/tabs/radio/radio_item.dart';

class RecitersDetailsScreen extends StatelessWidget {
  const RecitersDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => RadioItem(index: index, radio: ''),
      itemCount: ModelApp.readerNames.length,
    );
  }
}
