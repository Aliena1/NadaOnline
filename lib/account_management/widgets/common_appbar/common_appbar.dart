import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_texts/heading_text.dart';


AppBar buildCommonAppBar(String title) {
  return AppBar(
    shape: Border(
        bottom: BorderSide(
            color: Color(0xffE1E1E1),
            width: 1
        )
    ),
    title: HeadingText(title: title,fontSize: 16.0,),
    centerTitle: false,
    actions: [],
    // backgroundColor: AppColors.primaryBlueColor,
    leading: IconButton(
      icon: Icon(Icons.arrow_back,color: Colors.black,),
      onPressed: () {
        Get.back();
      },
    ),
    elevation: 0,
  );
}
