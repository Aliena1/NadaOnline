import 'package:enquiry_form/account_management/model/login_model.dart';
import 'package:enquiry_form/booking/booking_service/booking_service.dart';
import 'package:enquiry_form/booking/model/booking_detail_model/booking_detail_model.dart';
import 'package:enquiry_form/home_page/model/enquiry_model.dart' as enquiry;
import 'package:enquiry_form/home_page/model/vehicle_model.dart' as vehicle;
import 'package:enquiry_form/home_page/repository/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import '../../account_management/auth_storage/auth_storage_service.dart';
import '../../constants/app_strings.dart';
import '../../helper/connection/connection.dart';
import '../../helper/helper_functions/helper_functions.dart';
import '../../home_page/home_page_service/home_page_service.dart';
import '../../home_page/home_page_service/vehicle_service.dart';
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


  RxList<FinancingBank> financingBank = <FinancingBank>[].obs;
  RxList<PurchaseMode> purchaseMode = <PurchaseMode>[].obs;

  RxList<Scheme> scheme = <Scheme>[].obs;
  RxList<Occupation> occupation = <Occupation>[].obs;

  var modelSlug ="".obs;
  var displayName ="".obs;
  var variantName ="".obs;
  var colorName ="".obs;
  var bookingType ="".obs;


// For booking vehicle
  Rx<VehicleModel> vehicleModel = VehicleModel().obs;
  Rx<vehicle.VehicleData?> selectedVehicle = Rx<vehicle.VehicleData?>(null);
  Rx<vehicle.Variant?> selectedVariant = Rx<vehicle.Variant?>(null);
  Rx<vehicle.ModelColor?> selectedColor = Rx<vehicle.ModelColor?>(null);

  void onVehicleSelected(vehicle.VehicleData? vehicle) {
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
  final HomePageService homePageService=HomePageService();
  final VehicleService vehicleService=VehicleService();
  final BookingService bookingService=BookingService();
  var subscription;
  final connectionChecker = InternetConnectionChecker();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // selectedValue?.value = "Customer Type";
    getEnquiryDropdownData();
    getVehicles();

    subscription = connectionChecker.onStatusChange.distinct().listen(
          (InternetConnectionStatus status) async{
        if (status == InternetConnectionStatus.connected) {
          print('connecte from the internet');
          var lstEnquiryDetailKeys=await bookingService.getAllBookingDetailsKeys();
          for(var i in lstEnquiryDetailKeys){
            BookingDetailModel? bookingDetailModel=await bookingService.getBookingDetails(i);
            if(bookingDetailModel?.isSaved==false){
              bool isDone=await postBookingOfflineToOnline(bookingDetailModel?.toBookingDetailJson());
              if(isDone){
                bookingDetailModel?.isSaved=true;
                bookingService.updateBookingDetails(i,bookingDetailModel);
              }
            }
          }

        } else {
          print('Disconnected from the internet');
        }
      },
    );

  }


  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void getEnquiryDropdownData() async{
    try{
      var lstData=await homePageService.getAllCustomerTypes();
      financingBank.value = lstData[0].financingBank ?? [];
      purchaseMode.value = lstData[0].purchaseMode ?? [];
      scheme.value = lstData[0].scheme ?? [];
      occupation.value = lstData[0].occupation ?? [];

    }catch(e){
      change(null,status: RxStatus.error(e.toString()));
      throw Exception(e.toString());
    }
  }

  void getVehicles() async{
    try{
      var data=await vehicleService.getAllVehicle();
      vehicleModel.value=data[0];
    }catch(e){
      change(null,status: RxStatus.error(e.toString()));
      throw Exception(e.toString());
    }
  }


// POST BOOKING
  postBooking(context) async {

    String savedCreatedBy = AuthStorageService().getCreatedBy();
    print('created by = $savedCreatedBy');
    RxList<PurchaseModeListBooking> lstPurchaseModeListBooking=<PurchaseModeListBooking>[].obs;
    for(var i in selectedPurchaseMode){
      lstPurchaseModeListBooking.add(PurchaseModeListBooking(purchaseModeListBooking: i));
    }
    var offlineData=BookingDetailModel(
      model: displayName.value,
      modelSlug: modelSlug.value,
      variant: variantName.value,
      color: colorName.value,
      fullName: nameController.text,
      email: emailController.text,
      address: addressController.text,
      phone: phoneNumberController.text,
      alternatePhone: altPhoneNumberController.text,
      purchaseDate: formattedPurchaseDate,
      occupation: selectedValueOccupation?.value,
      bookingType: bookingType.value,
      bookingAmt: bookingAmountController.text,
      discountAmt: discountController.text,
      dealValue: discountedPrice.value,
      chequeNo: chequeNumberController.text,
      bankName: selectedValueFinancingBank?.value,
      purchaseMode: lstPurchaseModeListBooking,
      createdBy: savedCreatedBy,
      scheme: selectedValueScheme?.value

    );

    try{
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
        }
        else{
          Loading().hideLoading();

          HelperFunctions().snackBarCommon(context, AppStrings.noInternetConnection, 0);
          var lstEnqiuryDetail=await bookingService.getAllBookingDetails();
          if(!lstEnqiuryDetail.contains(offlineData)){
            bool saved=await bookingService.addItem(offlineData);
            if(saved){
              HelperFunctions().snackBarCommon(context, "Booking detail is saved successfully.", 1);
            }else{
              HelperFunctions().snackBarCommon(context, "Unable to save Booking Detail.", 0);
            }
          }else{
            HelperFunctions().snackBarCommon(context, "Already exists", 0);
          }
        }
      });
    }
    catch(e){
      Loading().hideLoading();
      HelperFunctions().snackBarCommon(context, e.toString(), 0);
      var lstEnqiuryDetail=await bookingService.getAllBookingDetails();

      if(!lstEnqiuryDetail.contains(offlineData)){
        bool saved=await bookingService.addItem(offlineData);
        if(saved){
          HelperFunctions().snackBarCommon(context, "Booking detail is saved successfully.", 1);
        }else{
          HelperFunctions().snackBarCommon(context, "Unable to save.", 0);
        }

      }else{
        HelperFunctions().snackBarCommon(context, "Exact Detail is already saved.", 0);
      }
      throw Exception(e.toString());
    }
  }

  Future<bool> postBookingOfflineToOnline(map) async {

    bool isSubmitted=false;

    try{
      await ConnectionChecker.isInternet().then((value) async{
        if(value == true){
          await bookingRepository.postBookingData(map).then((value) async{
            var response=BookingResponse.fromJson(value);
            if(response.status==true){
              isSubmitted=true;
            }
          });
        }
      });
      return isSubmitted;
    }
    catch(e){
      return isSubmitted;
    }
  }



}