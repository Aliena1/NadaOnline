import 'package:flutter/material.dart';
import 'delete_repository.dart';
import 'model/delete_account_model.dart';

class DeleteAccountController{
  late TextEditingController passwordTextController;
  final deleteRepo = DeleteRepository();
  final formKey = GlobalKey<FormState>();

  void initializeController(){
    passwordTextController = TextEditingController();

  }

  void deleteAccount(context) async{
    print('delete acc');
    // try{
    //   await ConnectionChecker.isInternet().then((value) async{
    //     if(value){
    //       var map={
    //         "password":passwordTextController.text,
    //       };
    //       print('map = $map');
    //       Loading().showLoading("Deleting account...");
    //       await deleteRepo.deleteProfile(map).then((value) {
    //         final response = DeleteAccountModel.fromJson(value);
    //
    //         if(response.status == true){
    //           Loading().hideLoading();
    //           HelperFunctions().snackBarCommon(Get.context, response.message.toString(), 1);
    //           AuthStorageService().clearStorage();
    //           Get.offAllNamed('/login');
    //         }else{
    //           Loading().hideLoading();
    //           HelperFunctions().snackBarCommon(Get.context, response.message.toString(), 0);
    //         }
    //
    //
    //       }
    //
    //       );
    //     }
    //     else{
    //       Loading().hideLoading();
    //       HelperFunctions().snackBarCommon(Get.context, AppStrings.noInternetConnection, 0);
    //     }
    //   });
    // }
    // catch(e){
    //   Loading().hideLoading();
    //   throw Exception(e.toString());
    // }
  }



}