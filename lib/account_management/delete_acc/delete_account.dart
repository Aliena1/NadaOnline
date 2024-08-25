import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../account_management/obscure_toggle.dart';
import '../../account_management/validators.dart';
import '../../constants/app_color.dart';
import '../widgets/common_appbar/common_appbar.dart';
import '../widgets/common_button.dart';
import '../widgets/common_image/common_image_asset.dart';
import '../widgets/common_password.dart';
import 'delete_account_controller.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}



class _DeleteAccountState extends State<DeleteAccount> {
  final deleteAccountController = DeleteAccountController();
  final obscureToggle = ObscureToggle();

  @override
  void initState() {
    deleteAccountController.initializeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildCommonAppBar("Delete Account"),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          // height: Dimensions.screenHeight-70,
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 50,),
              // const CommonImageAsset(),
              // Image.asset("assets/icon.png",height: 100,fit: BoxFit.fill),
              const SizedBox(height: 40,),
              const Text("Confirm Account Deletion",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),

              const Text(textAlign: TextAlign.center,"Once your account is deleted, the entire account record along with personal data will be permanently gone.",
                style: TextStyle(fontSize: 20,),),
              const SizedBox(height: 20,),

              const Align(alignment: Alignment.topLeft,child: Text("To confirm deletion, type your password below")),

              Obx(() =>Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: deleteAccountController.formKey,
                  child: CommonPassword(
                    onPressed: (){
                      obscureToggle.showHidePassword(obscureToggle.loginPasswordShowHide.value);
                    },
                    obscureValue: obscureToggle.loginPasswordShowHide.value,
                    controller: deleteAccountController.passwordTextController,
                    nullMessage: FormValidators.PASSWORD_VALIDATION_TEXT,
                  )
              ),
              ),

              const SizedBox(height: 20,),

              CommonButton(
                title: "Delete Account",
                color: AppColors.darkPastelBlue,
                onPressed: (){
                  if (deleteAccountController.formKey.currentState!
                      .validate()) {
                    deleteAccountController.deleteAccount(context);
                  }else {
                    FocusScope.of(context).unfocus();
                  }                },
              ),



            ],
          ),
        ),

      ),
    );
  }


}
