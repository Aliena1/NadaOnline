import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../helper/connection/connection.dart';
import '../../helper/helper_functions/helper_functions.dart';
import '../auth_storage/auth_storage_service.dart';
import '../model/otp_response.dart';
import '../repository/otp_repository.dart';

class OtpController extends GetxController{
  TextEditingController otpCodeController=TextEditingController();
  final otpRepo=OtpRepository();
  final formKey = GlobalKey<FormState>();
  var otpCode=''.obs;
  String? smsRetrieverCode;
  Timer? _timer;
  int remainingSeconds=0;
  final time="00:00".obs;

  // final smartAuth=SmartAuth();


  @override
  void onInit() {
    super.onInit();
    // getOtpSignature();

    _startTimer(120);

  }

  //  void getOtpSignature(){
  //   smartAuth.getAppSignature().then((value){
  //     if(kDebugMode){
  //       print("value=");
  //       print(value);
  //     }
  //     smsRetrieverCode=value;
  //   });
  // }

  // callApiOtp(context) async {
  //   try{
  //    await ConnectionChecker.isInternet().then((value) async{
  //      if(value == true){
  //        String savedEmail = AuthStorageService().getEmailSignUp();
  //
  //        // HelperFunctions().closeKeyboard(context);
  //      var map={
  //       "email_address":savedEmail,
  //       "otp_code":otpCode.value,
  //
  //       // "deviceToken":ApiConstants.push_Notification_Token
  //     };
  //     print(map);
  //     Loading().showLoading("Loading...");
  //     await otpRepo.otp(map).then((value) async{
  //       print(value);
  //       var response=OtpResponse.fromJson(value);
  //       if(response.status==true){
  //         Loading().hideLoading();
  //         Get.offAllNamed('/login');
  //         HelperFunctions().snackBarCommon(context, response.message.toString(), 1);
  //
  //       }
  //       else{
  //         Loading().hideLoading();
  //         HelperFunctions().snackBarCommon(context, response.message.toString(), 0);
  //       }
  //     });
  //    }else{
  //        HelperFunctions().snackBarCommon(context, AppStrings.noInternetConnection, 0);
  //      }
  //     }
  //     );
  //   }catch(e){
  //     Loading().hideLoading();
  //     throw Exception(e.toString());
  //   }
  // }
  //
  // // Resend otp
  // callApiToRequestOtpAgain(context) async {
  //   try{
  //    await ConnectionChecker.isInternet().then((value) async{
  //      if(value == true){
  //
  //        // getOtpSignature();
  //
  //        String savedEmail = AuthStorageService().getEmailSignUp();
  //
  //        // HelperFunctions().closeKeyboard(context);
  //      var map={
  //       "email_address":savedEmail,
  //        "otpSignature":smsRetrieverCode
  //       // "deviceToken":ApiConstants.push_Notification_Token
  //     };
  //     print(map);
  //     Loading().showLoading("Loading...");
  //     await otpRepo.resendOtp(map).then((value) async{
  //       print(value);
  //       var response=OtpResponse.fromJson(value);
  //       if(response.status==true){
  //         _startTimer(120);
  //         Loading().hideLoading();
  //         // Get.offAllNamed('/login');
  //         HelperFunctions().snackBarCommon(context, response.message.toString(), 1);
  //
  //       }
  //       else{
  //         Loading().hideLoading();
  //         HelperFunctions().snackBarCommon(context, response.message.toString(), 0);
  //       }
  //     });
  //    }else{
  //        HelperFunctions().snackBarCommon(context, AppStrings.noInternetConnection, 0);
  //      }
  //     }
  //     );
  //   }catch(e){
  //     Loading().hideLoading();
  //     throw Exception(e.toString());
  //   }
  // }

  _startTimer(int seconds){
    const duration=Duration(seconds: 1);
    remainingSeconds=seconds;
    _timer=Timer.periodic(duration, (Timer timer) {
      if(remainingSeconds==0){
        timer.cancel();
      }
      else{
        remainingSeconds--;
        int minutes=remainingSeconds~/60;
        int seconds=(remainingSeconds%60);
        time.value="${minutes.toString().padLeft(2,"0")}:${seconds.toString().padLeft(2,"0")}";
      }
    });
  }
}