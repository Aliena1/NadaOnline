import 'package:get/get.dart';

class ObscureToggle extends GetxController{
  var loginPasswordShowHide = true.obs;
  var loginConfirmPasswordShowHide = true.obs;

  void showHidePassword(password){
    password = !password;
    loginPasswordShowHide.value = password; // Update the value here

    print('password = $password');

  }
  void showHideConfirmPassword(password){
    password = !password;
    loginConfirmPasswordShowHide.value = password; // Update the value here

    print('password = $password');

  }
}

