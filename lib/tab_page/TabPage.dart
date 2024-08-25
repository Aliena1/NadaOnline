import 'package:enquiry_form/account_management/widgets/common_image/common_circular_image.dart';
import 'package:enquiry_form/account_management/widgets/common_margin/common_margin_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../account_management/widgets/common_texts/common_text_fifteen_px.dart';
import '../booking/booking_page.dart';
import '../home_page/screens/home_main_page.dart';
import 'controller/tab_page_controller.dart';

class TabPage extends StatelessWidget {
  TabPage({super.key});
  final TabPageController tabPageController = Get.put(TabPageController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: tabPageController.selectedIndex.value,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          actions: [
            IconButton(
              icon: Icon(Icons.logout,color: Colors.black,),
              onPressed: () {
                // Get.back();
              },
            ),

            // CommonNotificationButton(),
          ],
          automaticallyImplyLeading: false, // Removes the back button
          title: const Row(
            children: [
              CommonCircularImage(),
              CommonMarginWidth(),
              CommonTextFifteenPx(title: "Hi,Elina Pandey",),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: "Enquiry"),
              Tab(text: "Booking"),
            ],
            onTap: tabPageController.changeTabIndex,
          ),
        ),
        body: Obx(
              () => IndexedStack(
            index: tabPageController.selectedIndex.value,
            children: [
              HomeMainPage(), // Replace with your Enquiry Page
              BookingPage(), // Placeholder Booking Page
            ],
          ),
        ),
      ),
    );
  }
}
