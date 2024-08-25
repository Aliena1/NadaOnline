import 'package:enquiry_form/account_management/model/login_model.dart';
import 'package:enquiry_form/constants/app_strings.dart';
import 'package:enquiry_form/home_page/model/enquiry_model.dart';
import 'package:enquiry_form/home_page/model/vehicle_model.dart';
import 'package:enquiry_form/home_page/repository/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import '../../account_management/auth_storage/auth_storage_service.dart';
import '../../helper/connection/connection.dart';
import '../../helper/helper_functions/helper_functions.dart';
import '../../loader/loader.dart';
import '../model/enquiry_response.dart';

class HomeController extends GetxController with StateMixin<dynamic>{
  HomeRepository homeRepository=HomeRepository();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController remarksController = TextEditingController();



  var customerTypes = <String>[].obs; // Observable list to store customer types
  var enquiryTypes = <String>[].obs;
  var purchaseMode = <String>[].obs;

  var scheme = <String>[].obs;
  var occupation = <String>[].obs;

  var enquiredVehicles = <String>[].obs;
  var selectedVehicles = <String>[].obs;

  var selectedPurchaseMode = <String>[].obs;

  RxString? selectedValueCustomerType = "".obs;
  RxString? selectedValueEnquiryType = "".obs;
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
        final detail=await homeRepository.getDropdownData();
        print("spending = $detail");
        final response=EnquiryModelClass.fromJson(detail);
        if(response.status==true){
          customerTypes.value = response.data!.customerType?.map((item) => item.type!).toList() ?? [];
          enquiryTypes.value = response.data!.enquiryType?.map((item) => item.type!).toList() ?? [];
          purchaseMode.value = response.data!.purchaseMode?.map((item) => item.type!).toList() ?? [];

          scheme.value = response.data!.scheme?.map((item) => item.scheme!).toList() ?? [];
          occupation.value = response.data!.occupation?.map((item) => item.occupation!).toList() ?? [];

          print('get types = ${customerTypes.value}');
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
        final detail=await homeRepository.getVehicleData();
        final response=VehicleModel.fromJson(detail);
        if(response.status==true){
          enquiredVehicles.value = response.data?.map((item) => item.displayName ?? '').toList() ?? [];
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


  postEnquiry(context) async {
    print('enquired_model = $selectedVehicles');
    print('customer type = $selectedValueCustomerType');
    print('enquiry type = $selectedValueEnquiryType');
    print('purchase mode = $selectedPurchaseMode');
    print('occupation = $selectedValueOccupation');

    String savedCreatedBy = AuthStorageService().getCreatedBy();
    try{
      await ConnectionChecker.isInternet().then((value) async{

        if(value == true){
          var map;
          map={
            "enquired_model":selectedVehicles,
            "fullname":nameController.text,
            "email":emailController.text,
            "address":addressController.text,
            "phone":phoneNumberController.text,
            "customer_type":selectedValueCustomerType,
            "enquiry_type":selectedValueEnquiryType,
            "scheme":selectedValueScheme,
            "occupation":selectedValueOccupation,
            "purchase_mode":selectedPurchaseMode,
            "message":remarksController.text,
            "createdBy":savedCreatedBy,
          };

          print(map);
          Loading().showLoading("Logging...");
          await homeRepository.postEnquiryData(map).then((value) async{
            print(value);
            // print(value);
            var response=LoginResponse.fromJson(value);
            // var response=EnquiryResponse.fromJson(value);
            if(response.status==true){
              print('status trueee= ${response.status}');

              Loading().hideLoading();
            }
            else{
              print('status falsee= ${response.status}');

              Loading().hideLoading();
              HelperFunctions().snackBarCommon(context, response.message.toString(), 0);
            }
          });
        }else{
          HelperFunctions().snackBarCommon(context, AppStrings.noInternetConnection, 0);
        }
      });
    }
    catch(e){
      Loading().hideLoading();
      HelperFunctions().snackBarCommon(context, e.toString(), 0);

      throw Exception(e.toString());
    }

  }


}