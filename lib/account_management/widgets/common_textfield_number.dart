import 'package:flutter/material.dart';
import '../../constants/app_strings.dart';
import '../validators.dart';


class CommonTextfieldNumber extends StatelessWidget {
  const CommonTextfieldNumber({
    super.key,this.controller,this.nullMessage,this.hint=AppStrings.hintMobileNo,this.label = AppStrings.mobileNo
  });

  final controller,nullMessage,label,hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val){
        return FormValidators.validateFormField(val, nullMessage);
      },
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),

      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // Set border color to gray
        ),
        labelText: label, // Optional label text
        hintText: hint, // Hint text for mobile number
        // You can customize other properties like contentPadding, fillColor, etc.
      ),
      keyboardType: TextInputType.phone, // Set the keyboard type to phone number

    );
  }
}
