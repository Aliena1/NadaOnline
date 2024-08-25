import 'package:enquiry_form/booking/controller/booking_controller.dart';
import 'package:get/get.dart';

class TabPageController extends GetxController {
  var selectedIndex = 0.obs;
  final BookingController bookingController=Get.put(BookingController());
  void changeTabIndex(int index) {
    selectedIndex.value = index;
    if(index==1){
      if(bookingController.financingBank.isEmpty || bookingController.purchaseMode.isEmpty){
        bookingController.getEnquiryDropdownData();
        bookingController.getVehicles();
      }
    }
  }
}
