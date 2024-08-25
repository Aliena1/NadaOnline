import 'package:enquiry_form/account_management/model/login_model.dart';
import 'package:enquiry_form/constants/app_strings.dart';
import 'package:enquiry_form/home_page/model/enquiry_model.dart';
import 'package:enquiry_form/home_page/model/vehicle_model.dart';
import 'package:enquiry_form/home_page/repository/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../account_management/auth_storage/auth_storage_service.dart';
import '../../helper/connection/connection.dart';
import '../../helper/helper_functions/helper_functions.dart';
import '../../loader/loader.dart';
import '../home_page_service/enquiry_detail_service.dart';
import '../home_page_service/home_page_service.dart';
import '../home_page_service/vehicle_service.dart';
import '../model/enquiry_detail_model/enquiry_detail_model.dart';
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
  final HomePageService homePageService = HomePageService();
  final VehicleService vehicleService = VehicleService();
  final EnquiryDetailService enquiryDetailService = EnquiryDetailService();
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
          var lstEnquiryDetailKeys=await enquiryDetailService.getAllEnquiryDetailsKeys();
          for(var i in lstEnquiryDetailKeys){
            EnquiryDetailModel? enquiryDetailModel=await enquiryDetailService.getEnquiryDetails(i);
            if(enquiryDetailModel?.isSended==false){
              bool isDone=await postEnquiryOfflineToOnline(enquiryDetailModel?.toEnquiryDetailJson());
              if(isDone){
                enquiryDetailModel?.isSended=true;
                enquiryDetailService.updateEnquiryDetails(i,enquiryDetailModel);
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




  void assignNadaDetail() async{
    var lstData=await homePageService.getAllCustomerTypes();
    customerTypes.value = lstData[0].customerType?.map((item) => item.type!).toList() ?? [];
    enquiryTypes.value = lstData[0].enquiryType?.map((item) => item.type!).toList() ?? [];
    purchaseMode.value = lstData[0].purchaseMode?.map((item) => item.type!).toList() ?? [];
    scheme.value = lstData[0].scheme?.map((item) => item.scheme!).toList() ?? [];
    occupation.value = lstData[0].occupation?.map((item) => item.occupation!).toList() ?? [];
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
          await homePageService.clear();
          homePageService.addItem(response.data!);
          assignNadaDetail();
          print('get types = ${customerTypes.value}');
          // if (customerTypes.isNotEmpty) {
          //   selectedValue?.value = customerTypes.first; // Set initial selected value
          // }

          change(response.data,status: RxStatus.success());
        }
        else{
          HelperFunctions().snackBarCommon(Get.context, response.status.toString(), 0);
          assignNadaDetail();
          change(null,status: RxStatus.success());

        }
      }else{
        print("no Connection");
        assignNadaDetail();
        change(null,status: RxStatus.success());
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
          await vehicleService.clear();
          vehicleService.addItem(response);
          var data=await vehicleService.getAllVehicle();
          enquiredVehicles.value=data[0].data!.map((e)=>e.displayName.toString()).toList();
          change(response.data,status: RxStatus.success());
        }
        else{
          HelperFunctions().snackBarCommon(Get.context, response.status.toString(), 0);
          var data=await vehicleService.getAllVehicle();
          enquiredVehicles.value=data[0].data!.map((e)=>e.displayName.toString()).toList();
          change(enquiredVehicles.value,status: RxStatus.success());
        }
      }else{
        var data=await vehicleService.getAllVehicle();
        enquiredVehicles.value=data[0].data!.map((e)=>e.displayName.toString()).toList();
        change(enquiredVehicles.value,status: RxStatus.success());
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
    RxList<EnquiryModelList> lstselectedVehicles=<EnquiryModelList>[].obs;
    for(var i in selectedVehicles){
      lstselectedVehicles.add(EnquiryModelList(enquiryModel: i));
    }
    RxList<PurchaseModeList> lstPurchaseModeList=<PurchaseModeList>[].obs;
    for(var i in selectedPurchaseMode){
      lstPurchaseModeList.add(PurchaseModeList(purchaseModeList: i));
    }

    var offlineData=EnquiryDetailModel(
      enquiredModel:lstselectedVehicles.value,
      fullName:nameController.text,
      email:emailController.text,
      address:addressController.text,
      phone:phoneNumberController.text,
      customerType:selectedValueCustomerType?.value,
      enquiryType:selectedValueEnquiryType?.value,
      scheme:selectedValueScheme?.value,
      occupation:selectedValueOccupation?.value,
      purchaseMode:lstPurchaseModeList.value,
      message:remarksController.text,
      createdBy:savedCreatedBy,
    );

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
          var lstEnqiuryDetail=await enquiryDetailService.getAllEnquiryDetails();
          if(!lstEnqiuryDetail.contains(offlineData)){
            bool saved=await enquiryDetailService.addItem(offlineData);
            if(saved){
              HelperFunctions().snackBarCommon(context, "Enquiry detail is saved successfully.", 1);
            }else{
              HelperFunctions().snackBarCommon(context, "Unable to save.", 0);
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
      var lstEnqiuryDetail=await enquiryDetailService.getAllEnquiryDetails();

      if(!lstEnqiuryDetail.contains(offlineData)){
        bool saved=await enquiryDetailService.addItem(offlineData);
        if(saved){
          HelperFunctions().snackBarCommon(context, "Enquiry detail is saved successfully.", 1);
        }else{
          HelperFunctions().snackBarCommon(context, "Unable to save.", 0);
        }

      }else{
        HelperFunctions().snackBarCommon(context, "Exact Detail is already saved.", 0);
      }
      throw Exception(e.toString());
    }

  }



  Future<bool> postEnquiryOfflineToOnline(map) async {
    bool isSubmitted=false;
    try{
      await ConnectionChecker.isInternet().then((value) async{
        if(value == true){
          await homeRepository.postEnquiryData(map).then((value) async{
            var response=LoginResponse.fromJson(value);
            if(response.status==true){
              isSubmitted=true;
            }
          });
        }else{
          HelperFunctions().snackBarCommon(Get.context, AppStrings.noInternetConnection, 0);
        }

      });
      return isSubmitted;
    }
    catch(e){
      return isSubmitted;
    }



  }


}