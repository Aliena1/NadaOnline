import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_strings.dart';
import '../../helper/helper_functions/helper_functions.dart';
import '../auth_storage/auth_storage_service.dart';
import '../controller/forgot_pw_otp_controller.dart';
import '../widgets/common_account_button.dart';
import '../widgets/common_appbar_container.dart';
import '../widgets/common_rich_text.dart';
import '../widgets/common_text_desc.dart';
import '../widgets/common_widgets/common_appbar_account.dart';
import '../widgets/common_widgets/common_floating_logo.dart';

class ForgotPwOtp extends StatelessWidget {
  ForgotPwOtp({super.key});
  final otpController = Get.put(ForgotPwOtpController());
  String savedEmail = AuthStorageService().getEmail();
  final ScrollController _scrollController = ScrollController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color(0xFF2B569D);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color(0xFF605E5C);
    final focusNode = FocusNode();

    return Scaffold(
      appBar: commonBuildAppBar(),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset:
          false, // Prevent the screen from resizing when the keyboard appears
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController, // Add this line
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const CommonAppbarContainer(title: AppStrings.otp),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonRichText(
                      textSpanBefore: AppStrings.otpDesc,
                      textSpanAfter: savedEmail,
                      fontSize: 15.0,
                    ),
                    const SizedBox(height: 8),
                    const CommonTextDesc(desc: AppStrings.otpDescLong),
                    const SizedBox(height: 24),
                    const SizedBox(height: 24),
                    Obx(() => Center(
                      child: CommonRichText(
                          textSpanBefore: "Didn’t receive code? ",
                          textSpanAfter: otpController.time.value != "00:00"
                              ? otpController.time.value
                              : "Request again",
                          onTap: () {
                            if (otpController.time.value ==
                                "00:00") {
                              // otpController.callApiToRequestOtpAgain(context);
                            }
                          },
                          fontSize: 14.0),
                    ),),
                    const SizedBox(height: 24),
                    CommonAccountButton(
                      title: "Submit",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Validation successful, perform login action
                          // otpController.callApiForgotPwOtp(context);
                          HelperFunctions().closeKeyboard(context);
                          _scrollController.animateTo(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        }
                      },
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
