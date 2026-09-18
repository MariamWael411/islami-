import 'package:flutter/material.dart';

import '../../../../../core/utils/app_font.dart';

class MainErrorWidget extends StatelessWidget {
  MainErrorWidget({super.key, required this.error});

  String error;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error, style: AppFont.primaryBold20));
  }
}
