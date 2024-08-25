import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../constants/api_constants/api_constant.dart';
import '../../constants/app_strings.dart';
import '../../helper/connection/connection.dart';
import '../../helper/helper_functions/helper_functions.dart';
import '../../loader/loader.dart';
import '../../tab_page/TabPage.dart';
import '../auth_storage/auth_storage_service.dart';
import '../model/login_model.dart';
import '../repository/login_repository.dart';

class LoginController extends GetxController{
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final loginRepo=LoginRepository();
  final formKey = GlobalKey<FormState>();

  userLogin(context) async {
    try{
     await ConnectionChecker.isInternet().then((value) async{
       print(value);
       if(value == true){
         var map;
       map={
        "username":nameController.text,
        "password":passwordController.text,
      };

      print(map);
      Loading().showLoading("Logging...");
      await loginRepo.login(map).then((value) async{
        print(value);
        // print(value);
        var response=LoginResponse.fromJson(value);
        if(response.status==true){
          print('status trueee= ${response.status}');

          AuthStorageService().saveEmailAndPassword(nameController.text, passwordController.text);
          AuthStorageService().saveCreatedBy(response.customerDetail!.latestAdminUserInfo!.adminUserId.toString());


          Loading().hideLoading();
          Get.offAll(() => TabPage());
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
      }
      );
    }catch(e){
      Loading().hideLoading();
      HelperFunctions().snackBarCommon(context, e.toString(), 0);

      throw Exception(e.toString());
    }
  }
}