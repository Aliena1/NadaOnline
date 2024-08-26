import 'package:enquiry_form/home_page/model/enquiry_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../account_management/validators.dart';
import '../../account_management/widgets/common_appbar/common_appbar_with_notification.dart';
import '../../account_management/widgets/common_margin/common_margin_twenty.dart';
import '../../account_management/widgets/common_textfield_number.dart';
import '../../account_management/widgets/common_textfield_text.dart';
import '../../account_management/widgets/common_texts/heading_text_red.dart';
import '../../constants/app_color.dart';
import '../../constants/app_strings.dart';
import '../controller/home_controller.dart';

class HomeMainPage extends StatelessWidget {
   HomeMainPage({super.key});

   final HomeController homeController = Get.put(HomeController());

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildCommonAppBarWithNotification(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0,right: 10.0),
          child: Obx(()=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              CommonMargin(),
              HeadingTextRed(title: "Visitor/Customer Contact Details",),
              CommonMargin(),
              //name
              CommonTextfieldText(
                hint: AppStrings.nameHint,
                label: AppStrings.name,
                controller: homeController.nameController,
                nullMessage: FormValidators.USERNAME_EMAIL_VALIDATION_TEXT,
              ),

              CommonMargin(),
              //residence no.
              CommonTextfieldNumber(
                hint: AppStrings.residenceNumberHint,
                label: AppStrings.residenceNumber,
                controller: homeController.alternativePhone,
                nullMessage:
                FormValidators.USERNAME_EMAIL_VALIDATION_TEXT,
              ),
              CommonMargin(),
              //cell no.
              CommonTextfieldNumber(
                hint: AppStrings.cellNumberHint,
                label: AppStrings.cellNumber,
                controller: homeController.phoneNumberController,
                nullMessage:
                FormValidators.USERNAME_EMAIL_VALIDATION_TEXT,
              ),
              CommonMargin(),
              //email
              CommonTextfieldText(
                hint: AppStrings.emailHint,
                label: AppStrings.emailLabel,
                controller: homeController.emailController,
                nullMessage:
                FormValidators.USERNAME_EMAIL_VALIDATION_TEXT,
              ),
              CommonMargin(),
              //address
              CommonTextfieldText(
                hint: AppStrings.addressHint,
                label: AppStrings.address,
                controller: homeController.addressController,
                nullMessage:
                FormValidators.USERNAME_EMAIL_VALIDATION_TEXT,
              ),
              CommonMargin(),
              //occupation category


              //occupation
              InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(), // Border similar to TextField
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Padding inside the box
                ),
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: homeController.selectedValueOccupation!.value.isEmpty ? null : homeController.selectedValueOccupation?.value, // Show hint if value is empty
                  hint: Text('Occupation'),
                  items: homeController.occupation.map((Occupation value) {
                    return DropdownMenuItem<String>(
                      value: value.occupationId,
                      child: Text(value.occupation.toString()),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    homeController.selectedValueOccupation?.value = newValue ?? ""; // Update the selected value when changed

                  },),
              ),
              CommonMargin(),

              //organization
              CommonTextfieldText(
                hint: AppStrings.organizationHint,
                label: AppStrings.organization,
                // controller: loginController.phoneController,
                nullMessage:
                FormValidators.USERNAME_EMAIL_VALIDATION_TEXT,
              ),
              CommonMargin(),

              //industry
              CommonTextfieldText(
                hint: AppStrings.industryHint,
                label: AppStrings.industry,
                // controller: loginController.phoneController,
                nullMessage:
                FormValidators.USERNAME_EMAIL_VALIDATION_TEXT,
              ),

              CommonMargin(),
              //DOB
              CommonTextfieldText(
                hint: AppStrings.dobHint,
                label: AppStrings.dob,
                // controller: loginController.phoneController,
                nullMessage:
                FormValidators.USERNAME_EMAIL_VALIDATION_TEXT,
              ),

              CommonMargin(),
              HeadingTextRed(title: "Visitor's Enquiry Details",),
              CommonMargin(),


              InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(), // Border similar to TextField
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Padding inside the box
                ),
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: homeController.selectedValueEnquiryType!.value.isEmpty ? null : homeController.selectedValueEnquiryType?.value, // Show hint if value is empty
                  hint: Text('Enquiry Type'),
                  items: homeController.enquiryTypes.map((EnquiryType value) {
                    return DropdownMenuItem<String>(
                      value: value.type,
                      child: Text(value.type.toString()),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    homeController.selectedValueEnquiryType?.value = newValue ?? ""; // Update the selected value when changed

                  },),
              ),
              CommonMargin(),

              InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(), // Border similar to TextField
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Padding inside the box
                ),
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: homeController.selectedValueScheme!.value.isEmpty ? null : homeController.selectedValueScheme?.value, // Show hint if value is empty
                  hint: Text('Scheme'),
                  items: homeController.scheme.map((Scheme value) {
                    return DropdownMenuItem<String>(
                      value: value.id,
                      child: Text(value.scheme.toString()),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    homeController.selectedValueScheme?.value = newValue ?? ""; // Update the selected value when changed

                  },),
              ),
              CommonMargin(),

              InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(), // Border similar to TextField
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Padding inside the box
                ),
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: homeController.selectedValueCustomerType!.value.isEmpty ? null : homeController.selectedValueCustomerType?.value, // Show hint if value is empty
                  hint: Text('Customer Type'), // The hint that will be shown initially
                  items: homeController.customerTypes.map((CustomerType value) {
                    return DropdownMenuItem<String>(
                      value: value.type,
                      child: Text(value.type.toString()),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    homeController.selectedValueCustomerType?.value = newValue ?? ""; // Update the selected value when changed
                  },
                ),

              ),
              CommonMargin(),

              //Follow up
              CommonTextfieldText(
                hint: AppStrings.followUpDateHint,
                label: AppStrings.followUp,
                // controller: loginController.phoneController,
                nullMessage:
                FormValidators.USERNAME_EMAIL_VALIDATION_TEXT,
              ),
              CommonMargin(),

              // Remarks
              CommonTextfieldText(
                hint: "Remarks",
                label: "Remarks",
                controller: homeController.remarksController,
                nullMessage:
                FormValidators.USERNAME_EMAIL_VALIDATION_TEXT,
              ),

              CommonMargin(),


              HeadingTextRed(title: "Enquired Vehicles",),
              CommonMargin(),

              Container(
                width: double.infinity,
                height: 240,
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 16.0, // Space between items horizontally
                    runSpacing: 0.0, // Space between items vertically
                    children: List.generate(homeController.enquiredVehicles.length, (index) {
                      final vehicle = homeController.enquiredVehicles[index];
                      return SizedBox(
                        width: 160, // You can adjust this width based on your needs
                        child: CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          visualDensity: VisualDensity(horizontal: -4.0,vertical:-4.0),
                          title: Text(vehicle,style: TextStyle(fontSize: 12.0),),
                          value: homeController.selectedVehicles.contains(vehicle),
                          onChanged: (bool? value) {
                            if (value == true) {
                              homeController.selectedVehicles.add(vehicle);
                            } else {
                              homeController.selectedVehicles.remove(vehicle);
                            }
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ),

              CommonMargin(),

              HeadingTextRed(title: "Intended Purchase Mode",),
              // CommonMargin(),

              Container(
                width: double.infinity,
                height: 100,
                child: Wrap(
                  spacing: 16.0, // Space between items horizontally
                  runSpacing: 0.0,
                  children:  List.generate(homeController.purchaseMode.length, (index) {
                    final purchaseMode = homeController.purchaseMode[index];
                    return SizedBox(
                      width: 160,
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity(horizontal: -4.0,vertical:-4.0),
                        title: Text(purchaseMode.type.toString(), style: TextStyle(fontSize: 12.0),),
                        value: homeController.selectedPurchaseMode.contains(purchaseMode.type.toString()),
                        onChanged: (bool? value) {
                          if (value == true) {
                            homeController.selectedPurchaseMode.add(purchaseMode.type.toString());
                          } else {
                            homeController.selectedPurchaseMode.remove(purchaseMode.type.toString());
                          }
                        },
                      ),
                    );
                  }),
                )
              ),


              CommonMargin(),
              Center(
                child: ElevatedButton(
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightBgPurpleCircle,
                    textStyle: const TextStyle(
                        color: Colors.red, fontSize: 22, fontStyle: FontStyle.normal),

                  ),
                  onPressed: () {
                    print('submit pressed');
                      homeController.postEnquiry(context);

                  },
                ),
              ),

              SizedBox(height: 50,)



            ],
          ),)

        ),
      )
    );
  }
}

