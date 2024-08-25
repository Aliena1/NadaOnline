import 'package:flutter/material.dart';
import '../../constants/app_color.dart';
import '../validators.dart';

class CommonPassword extends StatelessWidget {
  const CommonPassword({
    super.key, this.label = "Password", this.hint = "Enter your password",this.controller,this.nullMessage,
    this.obscureValue = true, this.onPressed
  });
  final label,hint;
  final controller,nullMessage,obscureValue,onPressed;

  @override
  Widget build(BuildContext context) {
    // print(obscureValue);
    return TextFormField(
      validator: (val){
        return FormValidators.validateFormField(val, nullMessage);

      },

      controller: controller,
      obscureText: obscureValue,
      // Setting obscureText to true makes it a password field.
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),

      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // Set border color to gray
        ),
        labelText: label,
        hintText: hint,
        // suffixIcon: IconButton(icon: Icon(Icons.visibility_off) , onPressed: () {}),
        suffixIcon: IconButton(
            onPressed: onPressed,
            icon: obscureValue == false?Icon(
              Icons.visibility,
              color:AppColors.darkGrey,
            ):Icon(Icons.visibility_off,
              color: AppColors.darkGrey,
              )
        ),
        // You can add more decoration options like border, icons, etc. as needed.
      ),
    );
  }
}
