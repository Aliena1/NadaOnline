import 'package:enquiry_form/account_management/widgets/common_texts/subheading_text.dart';
import 'package:enquiry_form/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../../account_management/validators.dart';
import '../../account_management/widgets/common_appbar/common_appbar_with_notification.dart';
import '../../account_management/widgets/common_margin/common_margin_twenty.dart';
import '../../account_management/widgets/common_textfield_number.dart';
import '../../account_management/widgets/common_textfield_text.dart';
import '../../account_management/widgets/common_texts/heading_text_red.dart';
import '../../constants/app_strings.dart';
import '../account_management/auth_storage/auth_storage_service.dart';
import '../home_page/model/vehicle_model.dart';
import 'controller/booking_controller.dart';

class BookingPage extends StatelessWidget {

  final BookingController bookingController = Get.put(BookingController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildCommonAppBarWithNotification(),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 10.0),
              child: Obx(()=>Form(
                key: bookingController.formKey,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    CommonMargin(),
                    HeadingTextRed(title: "Customer Details",),
                    CommonMargin(),
                    //name
                    CommonTextfieldText(
                      hint: AppStrings.fullNameHint,
                      label: AppStrings.fullName,
                      controller: bookingController.nameController,
                      nullMessage: FormValidators.FULLNAME_VALIDATION_TEXT,
                    ),
                    CommonMargin(),
                    //residence no.
                    CommonTextfieldNumber(
                      hint: AppStrings.residenceNumberHint,
                      label: AppStrings.residenceNumber,
                      controller: bookingController.altPhoneNumberController,
                    ),
                    CommonMargin(),
                    //cell no.
                    CommonTextfieldNumber(
                      hint: AppStrings.cellNumberHint,
                      label: AppStrings.cellNumber,
                      controller: bookingController.phoneNumberController,
                      nullMessage: FormValidators.VALID_MOBILE_VALIDATION_TEXT,
                    ),
                    CommonMargin(),
                    //email
                    CommonTextfieldText(
                      hint: AppStrings.emailHint,
                      label: AppStrings.emailLabel,
                      controller: bookingController.emailController,
                      nullMessage: FormValidators.USERNAME_EMAIL_VALIDATION_TEXT,
                    ),
                    CommonMargin(),
                    //address
                    CommonTextfieldText(
                      hint: AppStrings.addressHint,
                      label: AppStrings.address,
                      controller: bookingController.addressController,
                      nullMessage: FormValidators.ADDRESS,
                    ),
                    CommonMargin(),


                    Text("Occupation",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),

                    //occupation
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), // Border similar to TextField
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Padding inside the box
                      ),
                      child: DropdownButtonFormField<String>(
                        validator: (val){
                          if(val ==null) {
                            return "Please Enter Occupation";
                          } else {
                            null;
                          }
                        },
                        isExpanded: true,
                        value: bookingController.selectedValueOccupation!.value.isEmpty ? null : bookingController.selectedValueOccupation?.value, // Show hint if value is empty
                        hint: Text('Occupation'),
                        items: bookingController.occupation.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          bookingController.selectedValueOccupation?.value = newValue ?? ""; // Update the selected value when changed

                        },),
                    ),


                    CommonMargin(),
                    HeadingTextRed(title: "Booking Details",),
                    CommonMargin(),

                    //Booking Date
                    //Intended Purchase Date

                        Text(
                          "Intended Purchase Date"
                        ),
                        TextFormField(
                          controller: bookingController.dateController,

                          validator: (val){
                            if(val ==null) {
                              return "Please Select Date";
                            } else {
                              null;
                            }                          },
                          readOnly: true,
                          onTap: (){
                            bookingController.selectPurchaseDate(context);
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey), // Set border color to gray
                            ),

                            hintText: bookingController.selectedPurchaseDate.value == null
                                ? "Select Date"
                            // : "${bookingController.selectedDate.value!.toLocal()}",)
                                : bookingController.formattedPurchaseDate,
                          ),

                        ),



                    CommonMargin(),

                    HeadingTextRed(title: "Vehicle",),
                    CommonMargin(),

                    Text("Vehicle Model",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),

                    // Vehicle Model
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), // Border similar to TextField
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Padding inside the box
                      ),
                      child: DropdownButtonFormField<VehicleData>(
                        validator: (val){
                          if(val ==null) {
                            return "Please Enter Model";
                          } else {
                            null;
                          }
                        },
                        isExpanded: true,
                        value: bookingController.selectedVehicle.value,
                        hint: Text('Select Vehicle Model'),
                        items: bookingController.vehicleModel.value.data?.map((vehicle) {
                        return DropdownMenuItem<VehicleData>(
                            value: vehicle,
                            child: Text(vehicle.displayName ?? ''),
                          );
                        }).toList(),
                        onChanged: (VehicleData? newValue) {
                         bookingController.modelSlug.value = newValue!.slug.toString();
                         bookingController.displayName.value = newValue.displayName.toString();

                         bookingController.onVehicleSelected(newValue);  // Use the method here

                          // bookingController.selectedVehicle(newValue);
                        },
                      ),
                    ),
                    CommonMargin(),

                    Text("Variant",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),


                    //Vehicle Color
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), // Border similar to TextField
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Padding inside the box
                      ),
                      child: DropdownButtonFormField<Variant>(
                        validator: (val){
                          if(val ==null) {
                            return "Please Enter Variant";
                          } else {
                            null;
                          }
                        },
                        isExpanded: true,
                        value: bookingController.selectedVariant.value,
                        hint: Text('Select Varient'),
                        items: bookingController.selectedVehicle.value?.variant?.map((variant) {
                          return DropdownMenuItem<Variant>(

                            value: variant,
                            child: Text(variant.name ?? ''),
                          );
                        }).toList(),
                        onChanged: (Variant? newValue) {
                          bookingController.variantName.value = newValue!.name.toString();

                          bookingController.onVariantSelected(newValue);  // Use the method here

                          // bookingController.selectedVariant(newValue);
                        },
                      )
                    ),

                    CommonMargin(),

                    Text("Color",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),

                    //Vehicle Color
                    InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(), // Border similar to TextField
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Padding inside the box
                        ),
                        child: DropdownButtonFormField<ModelColor>(
                          validator: (val){
                            if(val ==null) {
                              return "Please Enter Color";
                            } else {
                              null;
                            }
                          },
                          isExpanded: true,
                          value: bookingController.selectedColor.value,
                          hint: Text('Select Color'),
                          items: bookingController.selectedVehicle.value?.modelColor?.map((color) {
                            return DropdownMenuItem<ModelColor>(
                              value: color,
                              child: Text(color.colorName ?? ''),
                            );
                          }).toList(),
                          onChanged: (ModelColor? newValue) {
                            bookingController.colorName.value = newValue!.colorName.toString();

                            bookingController.onColorSelected(newValue);  // Use the method here

                            // bookingController.selectedVariant(newValue);
                          },
                        )
                    ),

                    CommonMargin(),

                    HeadingTextRed(title: "Financial Detail",),
                    CommonMargin(),



                    Text("Price",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),

                    // Price
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), // Border similar to TextField
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Padding inside the box
                      ),
                      child: Text(
                        bookingController.selectedVariant.value != null
                            ? 'Price: ${bookingController.selectedVariant.value!.specification?.price ?? ''}'
                            : 'No variant selected',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    CommonMargin(),

                    // Discount Offered
                    TextField(
                      controller: bookingController.discountController,
                      decoration: InputDecoration(
                        labelText: 'Enter Discount',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        bookingController.calculateDiscountedPrice();
                      },
                    ),

                    CommonMargin(),

                    Text("Deal Amount",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),

                    // Display Discounted Price
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), // Border similar to TextField
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Padding inside the box
                      ),
                      child: Text(
                        bookingController.discountedPrice.value.isNotEmpty
                            ? 'Deal Amount: ${bookingController.discountedPrice.value}'
                            : 'Enter a discount to see the final price',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ),
                    CommonMargin(),

                    TextFormField(
                     validator: (val){
                       if(val ==null) {
                         return "Please Enter Booking Amount";
                       } else {
                         null;
                       }
                      },
                      controller: bookingController.bookingAmountController,
                      decoration: InputDecoration(
                        labelText: 'Booking Amount',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),

                    CommonMargin(),

                    Text("Financing Bank",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),

                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), // Border similar to TextField
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Padding inside the box
                      ),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        value: bookingController.selectedValueFinancingBank!.value.isEmpty ? null : bookingController.selectedValueFinancingBank?.value, // Show hint if value is empty
                        hint: Text('Financing Bank'),
                        items: bookingController.financingBank.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          bookingController.selectedValueFinancingBank?.value = newValue ?? ""; // Update the selected value when changed

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
                        value: bookingController.selectedValueScheme!.value.isEmpty ? null : bookingController.selectedValueScheme?.value, // Show hint if value is empty
                        hint: Text('Scheme'),
                        items: bookingController.scheme.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          bookingController.selectedValueScheme?.value = newValue ?? ""; // Update the selected value when changed

                        },),
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
                        children: List.generate(bookingController.purchaseMode.length, (index) {
                          final purchaseMode = bookingController.purchaseMode[index];
                          return SizedBox(
                            width: 160,
                            child: CheckboxListTile(
                              contentPadding: EdgeInsets.zero,
                              visualDensity: VisualDensity(horizontal: -4.0,vertical:-4.0),
                              title: Text(purchaseMode, style: TextStyle(fontSize: 12.0),),
                              value: bookingController.selectedPurchaseMode.contains(purchaseMode),
                              onChanged: (bool? value) {
                                if (value == true) {
                                  bookingController.selectedPurchaseMode.add(purchaseMode);
                                } else {
                                  bookingController.selectedPurchaseMode.remove(purchaseMode);
                                }
                              },
                            ),
                          );
                        }),
                      ),
                    ),

                    CommonMargin(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          child: Text('Cheque'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightBgPurpleCircle,
                            // side: BorderSide(color: Colors.yellow, width: 5),
                            textStyle: const TextStyle(
                                color: Colors.grey, fontSize: 18, fontStyle: FontStyle.normal),

                          ),
                          onPressed: () {
                            if (bookingController.formKey.currentState!.validate()) {
                              if (bookingController.selectedPurchaseMode.isEmpty) {
                                // Proceed with the next step
                                Get.snackbar('Error', 'Please select at least one purchase mode');
                              }else {
                                bookingController.bookingType.value = "Cheque";
                                Get.dialog(
                                  Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      height: 200,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          TextFormField(
                                            controller: bookingController.chequeNumberController,

                                            validator: (val){
                                              if(val ==null) {
                                                return "Please enter cheque number";
                                              } else {
                                                null;
                                              }},
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                                border: const OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey), // Set border color to gray
                                                ),
                                                hintText: "Enter Cheque Number",
                                                label: Text("Cheque Number")
                                            ),

                                          ),
                                          SizedBox(height: 20),
                                          ElevatedButton(
                                            child: const Text(
                                              'Submit',
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(100, 45),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              if(bookingController.chequeNumberController.text.isEmpty){
                                                Get.snackbar('Error', 'Please enter cheque number',colorText: Colors.red);
                                              }else{
                                                Get.back();
                                                bookingController.postBooking(context);
                                              }

                                              // Close the dialog
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }

                          },
                        ),
                        ElevatedButton(
                          child: Text('Cash'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightBgPurpleCircle,

                            // side: BorderSide(color: Colors.yellow, width: 5),
                            textStyle: const TextStyle(
                                color: Colors.grey, fontSize: 18, fontStyle: FontStyle.normal),

                          ),
                          onPressed: () {
                            if (bookingController.formKey.currentState!.validate()) {
                              if (bookingController.selectedPurchaseMode.isEmpty) {
                                // Proceed with the next step
                                Get.snackbar('Error', 'Please select at least one purchase mode');
                              }else {
                                bookingController.bookingType.value = "cash";
                                bookingController.postBooking(context);
                              }
                            }
                          },
                        ),
                        ElevatedButton(
                          child: Text('QR'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightBgPurpleCircle,

                            // side: BorderSide(color: Colors.yellow, width: 5),
                            textStyle: const TextStyle(
                                color: Colors.grey, fontSize: 18, fontStyle: FontStyle.normal),

                          ),
                          onPressed: () {
                            bookingController.bookingType.value = "cash";
                          },
                        ),
                      ],
                    ),
                    CommonMargin(),


                    CommonMargin(),



                    SizedBox(height: 100,)

                  ],
                ),
              ),)

          ),
        )
    );
  }
}
