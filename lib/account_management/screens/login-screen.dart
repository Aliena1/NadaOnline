import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import '../../common_get_storage/common_storage.dart';
import '../../constants/app_color.dart';
import '../../constants/app_strings.dart';
import '../../helper/helper_functions/helper_functions.dart';
import '../../home_page/screens/home_main_page.dart';
import '../../tab_page/TabPage.dart';
import '../controller/login_controller.dart';
import '../obscure_toggle.dart';
import '../validators.dart';
import '../widgets/common_account_button.dart';
import '../widgets/common_textfield_text.dart';
import '../widgets/common_appbar_container.dart';
import '../widgets/common_password.dart';
import '../widgets/common_text_desc.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());
  final obscureToggle = ObscureToggle();
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    // String savedEmail = AuthStorageService().getEmailLogin();
    // String savedPassword = AuthStorageService().getPassword();
    // print('get email = $savedEmail');
    // if(savedEmail.isNotEmpty){
    //   Get.toNamed('/home');
    // }

    // savedEmail.isNotEmpty ? Get.toNamed('/home') : LoginPage()
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Platform.isAndroid  ? Colors.transparent:null
      ),
      child: Scaffold(
        // appBar: commonBuildAppBar(true),
        backgroundColor: Colors.white,
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: GestureDetector(
              onTap: () {
                HelperFunctions().closeKeyboard(context);
              },
              child: Column(
                children: [
                  const CommonAppbarContainer(title: AppStrings.loginTitle),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                        key: loginController.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonTextfieldText(
                              hint: AppStrings.usernameHint,
                              label: AppStrings.username,
                              controller: loginController.nameController,
                              nullMessage:
                                  FormValidators.USERNAME_EMAIL_VALIDATION_TEXT,
                            ),
                            const SizedBox(height: 16),
                            Obx(() => CommonPassword(
                                  onPressed: () {
                                    obscureToggle.showHidePassword(obscureToggle
                                        .loginPasswordShowHide.value);
                                    // print('obscure = ${obscureToggle.loginPasswordShowHide.value}');
                                  },
                                  obscureValue:
                                      obscureToggle.loginPasswordShowHide.value,
                                  controller: loginController.passwordController,
                                  nullMessage:
                                      FormValidators.PASSWORD_VALIDATION_TEXT,
                                )),

                            const SizedBox(height: 16),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed('/forgotPassword');
                                },
                                child: const CommonTextDesc(
                                  desc: "Forgot password?",
                                )),
                            const SizedBox(height: 16),
                            // CommonAccountButton(title: "Login",onPressed:(){Get.toNamed('/home');}),
                            // CommonTextDesc(
                            //   desc: "Forgot password?",
                            // ),
                            const SizedBox(height: 16),
                            CommonAccountButton(
                              title: "Login",
                              onPressed: () {
                                // HelperFunctions().closeKeyboard(context);
                                print("object");
                                if (loginController.formKey.currentState!
                                    .validate()) {
                                  loginController.userLogin(context);
                                }
                              },
                            ),
                            const SizedBox(height: 24),
                          ],
                        )),
                  ),


                  const SizedBox(height: 40,),
                ],
              ),
            ),
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: buildFloatingLogo(),
      ),
    );
  }

  Future<void> _authenticateUser(AuthenticationType type, BuildContext context) async {
    bool isAuthenticated = false;
    String authMethod = '';

    switch (type) {
      case AuthenticationType.fingerprint:
        isAuthenticated = await _authenticateWithBiometric();
        authMethod = 'Fingerprint';
        break;
      case AuthenticationType.faceID:
        isAuthenticated = await _authenticateWithBiometric();
        authMethod = 'Face ID';
        break;
    }

    if (isAuthenticated) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$authMethod authentication success')),
      );
      // loginController.userLogin(context,true);

    } else {
      // Show error message or alternative authentication method
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$authMethod authentication failed')),
      );
    }
  }

  Future<bool> _authenticateWithBiometric() async {
    try {
      return await auth.authenticate(
        localizedReason: 'Authenticate to access your account',
        // biometricOnly: true, // Set to true for biometric authentication only
      );
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

}
enum AuthenticationType {
  fingerprint,
  faceID,
}