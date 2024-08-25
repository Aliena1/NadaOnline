import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../helper/connection/connection.dart';
import '../../helper/helper_functions/helper_functions.dart';

import '../auth_storage/auth_storage_service.dart';
import '../model/otp_response.dart';
import '../repository/forgot_pw_repository.dart';

class ForgotPwOtpController extends GetxController{
  TextEditingController otpCodeController=TextEditingController();
  final fogotPwOtpRepo=ForgotPwRepository();
  final formKey = GlobalKey<FormState>();
  var otpCode='';
  Timer? _timer;
  int remainingSeconds=0;
  final time="00:00".obs;

  @override
  void onInit(){
    super.onInit();
    _startTimer(120);
  }

  // // get otp
  // callApiForgotPwOtp(context) async {
  //   try{
  //     await ConnectionChecker.isInternet().then((value) async{
  //       if(value == true){
  //         String savedEmail = AuthStorageService().getEmail();
  //
  //         // HelperFunctions().closeKeyboard(context);
  //         var map={
  //           "username":savedEmail,
  //           "otp_number":otpCode,
  //           // "deviceToken":ApiConstants.push_Notification_Token
  //         };
  //         print(map);
  //         Loading().showLoading("Loading...");
  //         await fogotPwOtpRepo.passwordReset(map).then((value) async{
  //           print(value);
  //           var response=OtpResponse.fromJson(value);
  //           if(response.status==true){
  //             Loading().hideLoading();
  //             Get.offNamed('/forgotPwReset');
  //             HelperFunctions().snackBarCommon(context, response.message.toString(), 1);
  //
  //           }
  //           else{
  //             Loading().hideLoading();
  //             HelperFunctions().snackBarCommon(context, response.message.toString(), 0);
  //           }
  //         });
  //       }else{
  //         HelperFunctions().snackBarCommon(context, AppStrings.noInternetConnection, 0);
  //       }
  //     }
  //     );
  //   }catch(e){
  //     Loading().hideLoading();
  //     throw Exception(e.toString());
  //   }
  // }
  // // Resend otp
  // callApiToRequestOtpAgain(context) async {
  //   try{
  //     await ConnectionChecker.isInternet().then((value) async{
  //       if(value == true){
  //         String savedEmail = AuthStorageService().getEmail();
  //
  //         // HelperFunctions().closeKeyboard(context);
  //         var map={
  //           "username":savedEmail,
  //           // "deviceToken":ApiConstants.push_Notification_Token
  //         };
  //         Loading().showLoading("Loading...");
  //         await fogotPwOtpRepo.resendOtp(map).then((value) async{
  //           print(value);
  //           var response=OtpResponse.fromJson(value);
  //           if(response.status==true){
  //             _startTimer(120);
  //             Loading().hideLoading();
  //             // Get.offAllNamed('/login');
  //             HelperFunctions().snackBarCommon(context, response.message.toString(), 1);
  //
  //           }
  //           else{
  //             Loading().hideLoading();
  //             HelperFunctions().snackBarCommon(context, response.message.toString(), 0);
  //           }
  //         });
  //       }else{
  //         HelperFunctions().snackBarCommon(context, AppStrings.noInternetConnection, 0);
  //       }
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