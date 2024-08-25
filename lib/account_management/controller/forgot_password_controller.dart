import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../helper/connection/connection.dart';
import '../../helper/helper_functions/helper_functions.dart';

import '../auth_storage/auth_storage_service.dart';
import '../model/otp_response.dart';
import '../repository/forgot_pw_repository.dart';

class ForgotPasswordController extends GetxController{
  TextEditingController emailOrMobileNoController=TextEditingController();
  TextEditingController oldPasswordController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  final forgotPwRepo=ForgotPwRepository();
  final formKey = GlobalKey<FormState>();
  var otpCode='';



  // forgot password reset
  // callApiPwReset(context) async {
  //   try{
  //    await ConnectionChecker.isInternet().then((value) async{
  //      if(value == true){
  //        // HelperFunctions().closeKeyboard(context);
  //      var map={
  //       "oldPassword":oldPasswordController.text,
  //       "password":passwordController.text,
  //       "newPassword":confirmPasswordController.text,
  //     };
  //     print(map);
  //     Loading().showLoading("Loading...");
  //     await forgotPwRepo.passwordReset(map).then((value) async{
  //       print(value);
  //       var response=ResetPwResponse.fromJson(value);
  //       if(response.status==true){
  //         Loading().hideLoading();
  //         Get.offAllNamed('/login');
  //         HelperFunctions().snackBarCommon(context, response.message.toString(), 1);
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
}