import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../common_texts/common_text_fifteen_px.dart';
import '../common_texts/heading_text.dart';

AppBar buildCommonAppBarWithNotification([String title = ""]) {
  return AppBar(
    title: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFifteenPx(title: "Hi,",fontWeight: FontWeight.w400,),
        CommonTextFifteenPx(title: "Elina Pandey",),
      ],
    ),
    centerTitle: false,
    actions: [
      IconButton(
        icon: Icon(Icons.notifications_active_outlined,color: Colors.black,),
        onPressed: () {
          // Get.back();
        },
      ),

      // CommonNotificationButton(),
    ],
    // backgroundColor: AppColors.primaryBlueColor,
    leading: Builder(
      builder: (BuildContext context) {
        return  IconButton(
          icon: Icon(Icons.menu,color: Colors.black,),
          onPressed: () {
            Scaffold.of(Get.context!).openDrawer();
          },
        );
      }
    ),
    elevation: 0,
  );
}
