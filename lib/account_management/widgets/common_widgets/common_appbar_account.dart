import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../constants/app_color.dart';

AppBar commonBuildAppBar([bool? fromLogin]) {
  return AppBar(
    backgroundColor: AppColors.darkPastelBlue,
    leading: IconButton(
      icon: fromLogin == true?Container():const Icon(Icons.arrow_back,color: Colors.white,),
      onPressed: () {
        Get.back();
      },
    ),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.paleLilac, // <-- SEE HERE
      statusBarIconBrightness: Brightness.light, //<-- For Android SEE HERE (dark icons)
      statusBarBrightness: Brightness.dark, //<-- For iOS SEE HERE (dark icons)
    ),
  );
}