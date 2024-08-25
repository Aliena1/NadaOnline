import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../constants/app_strings.dart';
import '../../helper/helper_functions/helper_functions.dart';
import '../controller/forgot_password_controller.dart';
import '../obscure_toggle.dart';
import '../validators.dart';
import '../widgets/common_account_button.dart';
import '../widgets/common_appbar_container.dart';
import '../widgets/common_password.dart';
import '../widgets/common_widgets/common_appbar_account.dart';
import '../widgets/common_widgets/common_floating_logo.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  final forgotPwController = Get.put(ForgotPasswordController());
  final obscureToggleOldPw = ObscureToggle();
  final obscureToggle = ObscureToggle();
  final obscureToggleConfirmPassword = ObscureToggle();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make status bar transparent
      statusBarIconBrightness: Brightness.light, // Set the status bar icons to white
      statusBarBrightness: Brightness.dark, // For iOS
    ));

    return Scaffold(
      // appBar: commonBuildAppBar(),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, // Prevent the screen from resizing when the keyboard appears
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Obx(() =>
        Column(
          children: [
            const CommonAppbarContainer(title: AppStrings.resetPassword,fromResetPw: true,),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: forgotPwController.formKey,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CommonPassword(
                     hint: "Enter your old password",
                     label: "Old Password",
                     nullMessage: FormValidators.OLD_PASSWORD,
                     onPressed: (){
                       obscureToggleOldPw.showHidePassword(obscureToggleOldPw.loginPasswordShowHide.value);
                     },
                     obscureValue: obscureToggleOldPw.loginPasswordShowHide.value,
                     controller: forgotPwController.oldPasswordController,
                   ),
                   const SizedBox(height: 16),

                   CommonPassword(
                     nullMessage: FormValidators.PASSWORD_VALIDATION_TEXT,
                     onPressed: (){
                       obscureToggle.showHidePassword(obscureToggle.loginPasswordShowHide.value);
                     },
                     obscureValue: obscureToggle.loginPasswordShowHide.value,
                     controller: forgotPwController.passwordController,
                   ),
                   const SizedBox(height: 16),
                   CommonPassword(
                     label: AppStrings.newPassword,
                     hint: AppStrings.newPasswordHint,
                     nullMessage: FormValidators.NEW_CONFIRM_PASSWORD,
                     onPressed: (){
                       obscureToggleConfirmPassword.showHideConfirmPassword(obscureToggleConfirmPassword.loginConfirmPasswordShowHide.value);
                     },
                     obscureValue: obscureToggleConfirmPassword.loginConfirmPasswordShowHide.value,
                     controller: forgotPwController.confirmPasswordController,
                   ),
                   const SizedBox(height: 16),
                   CommonAccountButton(
                     title: "Reset",
                     onPressed: (){
                       HelperFunctions().closeKeyboard(context);
                       if(forgotPwController.formKey.currentState!.validate()){
                         // forgotPwController.callApiPwReset(context);
                       }
                     },
                   ),
                   const SizedBox(height: 24),
                 ],
               ),
              ),
            ),
          ],
        ),
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFloatingLogo(),
    );
  }
}
