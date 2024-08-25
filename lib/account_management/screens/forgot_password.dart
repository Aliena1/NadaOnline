import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_strings.dart';
import '../../helper/helper_functions/helper_functions.dart';
import '../controller/forgot_password_controller.dart';
import '../validators.dart';
import '../widgets/common_account_button.dart';
import '../widgets/common_appbar_container.dart';
import '../widgets/common_text_desc.dart';
import '../widgets/common_textfield_text.dart';
import '../widgets/common_widgets/common_appbar_account.dart';
import '../widgets/common_widgets/common_floating_logo.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final forgotPwController = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonBuildAppBar(),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, // Prevent the screen from resizing when the keyboard appears
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const CommonAppbarContainer(title: AppStrings.forgotPassword),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CommonTextDesc(desc: AppStrings.forgotPwDesc),
                    const SizedBox(height: 12),

                    Form(
                      key: forgotPwController.formKey,
                      child: CommonTextfieldText(
                        label: AppStrings.emailLabelForgetPw,hint: AppStrings.emailHintForgetPw,
                        controller: forgotPwController.emailOrMobileNoController,
                        nullMessage: FormValidators.EMAIL_VALIDATION_TEXT_FORGOT_PW,
                      ),
                    ),


                    const SizedBox(height: 16),
                    CommonAccountButton(title: "Reset Password",
                    onPressed: (){
                      HelperFunctions().closeKeyboard(context);
                      if(forgotPwController.formKey.currentState!.validate()){
                        // forgotPwController.callApiForgotPassword(context);
                      }
                    }
                    ),
                    const SizedBox(height: 24),
                  ],
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
