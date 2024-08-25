import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/app_strings.dart';
import '../validators.dart';

class CommonTextfieldText extends StatelessWidget {
  const CommonTextfieldText({
    super.key,this.controller,this.nullMessage,this.hint=AppStrings.hintMobileNo,
    this.label = AppStrings.mobileNo, this.onChanged,this.inputFormatter =false
  });
  final controller,nullMessage,label,hint,onChanged,inputFormatter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatter?[ FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")), ]:[],
      validator: (val){
        return FormValidators.validateFormField(val, nullMessage);
      },
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // Set border color to gray
        ),
        labelText: label,
        hintText: hint,
        // You can customize other properties like contentPadding, fillColor, etc.
      ),
    );
  }
}
