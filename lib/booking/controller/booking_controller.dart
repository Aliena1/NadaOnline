import 'package:enquiry_form/account_management/model/login_model.dart';
import 'package:enquiry_form/home_page/model/enquiry_model.dart' as enquiry;
import 'package:enquiry_form/home_page/model/vehicle_model.dart' as vehicle;
import 'package:enquiry_form/home_page/repository/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';
import '../../account_management/auth_storage/auth_storage_service.dart';
import '../../constants/app_strings.dart';
import '../../helper/connection/connection.dart';
import '../../helper/helper_functions/helper_functions.dart';
import '../../home_page/model/enquiry_model.dart';
import '../../home_page/model/vehicle_model.dart';
import '../../loader/loader.dart';
import '../model/booking_response.dart';
import '../repository/booking_repo.dart';

class BookingController extends GetxController with StateMixin<dynamic>{
  BookingRepository bookingRepository=BookingRepository();
  final formKey = GlobalKey<FormState>();

  // For QR
  String refId = '';
  String hasError = '';


  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController altPhoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  // Controller for discount input
  TextEditingController discountController = TextEditingController();
  TextEditingController bookingAmountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController chequeNumberController = TextEditingController();

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<DateTime?> selectedPurchaseDate = Rx<DateTime?>(null);

  // Function to open the date picker and update the selected date
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      print('get seletcted val = ${selectedDate.value}');
    }
  }

  Future<void> selectPurchaseDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedPurchaseDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedPurchaseDate.value) {
      selectedPurchaseDate.value = pickedDate;
      print('get seletcted val = ${selectedPurchaseDate.value}');
    }
  }

  String get formattedDate {
    if (selectedDate.value != null) {
      return DateFormat('yyyy-MM-dd').format(selectedDate.value!);
    }
    return "No date selected";
  }

  String get formattedPurchaseDate {
    if (selectedPurchaseDate.value != null) {
      return DateFormat('yyyy-MM-dd').format(selectedPurchaseDate.value!);
    }
    return "No date selected";
  }


  var financingBank = <String>[].obs;
  var purchaseMode = <String>[].obs;

  var scheme = <String>[].obs;
  var occupation = <String>[].obs;

  var modelSlug ="".obs;
  var displayName ="".obs;
  var variantName ="".obs;
  var colorName ="".obs;
  var bookingType ="".obs;


// For booking vehicle
  Rx<VehicleModel> vehicleModel = VehicleModel().obs;
  Rx<vehicle.Data?> selectedVehicle = Rx<vehicle.Data?>(null);
  Rx<vehicle.Variant?> selectedVariant = Rx<vehicle.Variant?>(null);
  Rx<vehicle.ModelColor?> selectedColor = Rx<vehicle.ModelColor?>(null);

  void onVehicleSelected(vehicle.Data? vehicle) {
    selectedVehicle.value = vehicle;
    selectedVariant.value = null; // Reset the selected variant when a new vehicle is chosen
    selectedColor.value = null; // Reset the selected variant when a new vehicle is chosen
  }

  void onVariantSelected(Variant? variant) {
    selectedVariant.value = variant;
  }

  void onColorSelected(ModelColor? modelColor) {
    selectedColor.value = modelColor;
  }



  // Observable for the final discounted price
  RxString discountedPrice = ''.obs;

  // Function to calculate the discounted price
  void calculateDiscountedPrice() {
    if (selectedVariant.value != null && discountController.text.isNotEmpty) {
      String priceString = selectedVariant.value!.specification?.price ?? '0';

      // Remove commas from the price string
      priceString = priceString.replaceAll(',', '');

      double originalPrice = double.tryParse(priceString) ?? 0;
      double discount = double.tryParse(discountController.text) ?? 0;

      double finalPrice = originalPrice - (originalPrice * discount / 100);
      discountedPrice.value = finalPrice.toStringAsFixed(2);
    } else {
      discountedPrice.value = '';
    }
  }

  var selectedPurchaseMode = <String>[].obs;

  RxString? selectedValueCustomerType = "".obs;
  RxString? selectedValueFinancingBank = "".obs;
  RxString? selectedValueScheme = "".obs;
  RxString? selectedValueOccupation = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // selectedValue?.value = "Customer Type";
    getEnquiryDropdownData();
    getVehicles();

  }

  void getEnquiryDropdownData() async{
    try{
      change(null,status: RxStatus.loading());
      final isOnline=await ConnectionChecker.isInternet();
      if(isOnline){
        final detail=await bookingRepository.getDropdownData();
        print("spending = $detail");
        final response=EnquiryModelClass.fromJson(detail);
        if(response.status==true){
          financingBank.value = response.data!.financingBank?.map((item) => item.bankName!).toList() ?? [];
          purchaseMode.value = response.data!.purchaseMode?.map((item) => item.type!).toList() ?? [];

          scheme.value = response.data!.scheme?.map((item) => item.scheme!).toList() ?? [];
          occupation.value = response.data!.occupation?.map((item) => item.occupation!).toList() ?? [];

          // if (customerTypes.isNotEmpty) {
          //   selectedValue?.value = customerTypes.first; // Set initial selected value
          // }

          change(response.data,status: RxStatus.success());
        }
        else{
          HelperFunctions().snackBarCommon(Get.context, response.status.toString(), 0);
          change(null,status: RxStatus.error());
        }
      }else{
        print("no Connection");
        change(null,status: RxStatus.error("No Internet Connection"));
      }
    }catch(e){
      change(null,status: RxStatus.error(e.toString()));
      throw Exception(e.toString());
    }
  }

  void getVehicles() async{
    try{
      change(null,status: RxStatus.loading());
      final isOnline=await ConnectionChecker.isInternet();
      if(isOnline){
        final detail=await bookingRepository.getVehicleData();
        final response=VehicleModel.fromJson(detail);
        if(response.status==true){
          vehicleModel.value = response;
          change(response.data,status: RxStatus.success());
        }
        else{
          HelperFunctions().snackBarCommon(Get.context, response.status.toString(), 0);
          change(null,status: RxStatus.error());
        }
      }else{
        change(null,status: RxStatus.error("No Internet Connection"));
      }
    }catch(e){
      change(null,status: RxStatus.error(e.toString()));
      throw Exception(e.toString());
    }
  }


// POST BOOKING
  postBooking(context) async {

    String savedCreatedBy = AuthStorageService().getCreatedBy();
    print('created by = $savedCreatedBy');
    // try{
      await ConnectionChecker.isInternet().then((value) async{
        if(value == true){
          var map;
          map={
            "model":displayName.value,
            "model_slug":modelSlug.value,
            "variant":variantName.value,
            "color":colorName.value,
            "fullname":nameController.text,
            "email":emailController.text,
            "address":addressController.text,
            "phone":phoneNumberController.text,
            "alternate_phone":altPhoneNumberController.text,
            "purchaseDate":formattedPurchaseDate,
            "occupation":selectedValueOccupation?.value,
            "bookingType":bookingType.value,
            "bookingAmt":bookingAmountController.text,
            "discountAmt":discountController.text,
            "dealvalue":discountedPrice.value,
            "chequeNo":chequeNumberController.text,
            "bankName":selectedValueFinancingBank?.value,
            "purchase_mode":selectedPurchaseMode,
            "createdBy":savedCreatedBy,
            "scheme": selectedValueScheme?.value
          };

          print(map);
          // Loading().showLoading("Logging...");
          await bookingRepository.postBookingData(map).then((value) async{
            print(value);
            // print(value);
            var response=BookingResponse.fromJson(value);
            print('get response booking = $response');
          if(response.status==true){
              print('status trueee= ${response.status}');

              Loading().hideLoading();
            }
            else{
              Loading().hideLoading();
              HelperFunctions().snackBarCommon(context, response.message.toString(), 0);

              print('status falsee= ${response.status}');

            }
          });
        }else{
          Loading().hideLoading();

          HelperFunctions().snackBarCommon(context, AppStrings.noInternetConnection, 0);
        }
      });
    // }
    // catch(e){
    //   Loading().hideLoading();
    //   HelperFunctions().snackBarCommon(context, e.toString(), 0);
    //
    //   throw Exception(e.toString());
    // }
  }
}