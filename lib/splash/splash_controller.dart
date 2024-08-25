import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../account_management/auth_storage/auth_storage_service.dart';
import '../../account_management/model/login_model.dart';
import '../../helper/connection/connection.dart';
import '../../services/remote_services/remote_services.dart';
import '../account_management/screens/login-screen.dart';
import '../constants/api_constants/api_constant.dart';
import '../constants/app_strings.dart';
import '../helper/helper_functions/helper_functions.dart';
import '../tab_page/TabPage.dart';

class SplashScreenController extends GetxController{

  Future<void> check() async {

    await ConnectionChecker.isInternet().then((value) async{
      if(value == true){

        String savedEmailOrNumber =  AuthStorageService().getEmailLogin();
        String savedPw =  AuthStorageService().getPassword();

        print('email saved=$savedEmailOrNumber " " $savedPw');


        if (savedEmailOrNumber.isNotEmpty && savedPw.isNotEmpty) {
          var map = {
            "username": savedEmailOrNumber,
            "password": savedPw,
          };
          print('true = $map');

          await RemoteServices.postMethod(ApiConstants.LOGIN, map).then((value) {

            final response = LoginResponse.fromJson(value);

            if (response.status == true) {
              print('response = $response');

              Get.offAll(() => TabPage());

              Future.delayed(const Duration(
                  milliseconds: 800
              )).then((value) => FlutterNativeSplash.remove());
            } else {
              print('response false = ${response.message}');

              HelperFunctions().snackBarCommon(Get.context, response.message.toString(), 0);
              FlutterNativeSplash.remove();
            }
          });
        }
        else {
          Get.offAll(LoginScreen());
          Future.delayed(const Duration(
              milliseconds: 800
          )).then((value) => FlutterNativeSplash.remove());
        }
        FlutterNativeSplash.remove();
      }
      else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
            content: Text(AppStrings.noInternetConnection),
          ),
        );
        FlutterNativeSplash.remove();
      }
    });
  }
}