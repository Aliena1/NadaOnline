import 'package:get/get_utils/src/get_utils/get_utils.dart';

class FormValidators{
  static const USERNAME_VALIDATION_TEXT= "Please enter your username";
  static const FULLNAME_VALIDATION_TEXT= "Please enter your fullname";
  static const USERNAME_EMAIL_VALIDATION_TEXT="Please enter your username";
  static const FIRST_NAME_VALIDATION_TEXT="Please enter your first name";
  static const SURNAME_VALIDATION_TEXT="Please enter your surname";
  static const DATE_VALIDATION_TEXT="Please select your date of birth";
  static const EMAIL_VALIDATION_TEXT="Please enter your email address";
  static const ADDRESS="Please enter your address";
  static const EMAIL_VALIDATION_TEXT_FORGOT_PW="Please enter your email address or mobile number";
  static const securityCode="Please enter the security code";
  static const currentPasswordText = "Please enter current password";
  static const newPasswordText= "Please enter new password";
  static const MOBILE_NO_VALIDATION_TEXT="Please enter your mobile number";
  static const PASSWORD_VALIDATION_TEXT="Please enter your password";
  static const CONFIRM_PASSWORD_VALIDATION_TEXT="Please confirm your password";
  static const VALID_EMAIL_VALIDATION_TEXT="Please enter valid email address";
  static const VALID_MOBILE_VALIDATION_TEXT="Please enter valid mobile Number";
  static const PASSWORD_LENGTH_VALIDATION="The password must be at least 8 characters.";
  static const CONFIRM_PASSWORD_LENGTH_VALIDATION="The confirm password must be at least 8 characters.";
  static const currentPasswordNewPassword="Current password must match the old password.";
  static const AMOUNT_VALIDATION="Please enter valid amount.";
  static const TRAINING_MESSAGE_VALIDATION="Please enter your Message.";
  static const TRAINING_LOCATION_VALIDATION="Please enter Location.";
  static const TRAINING_PROGRAM_VALIDATION="Please Select Program.";
  static const TRAINING_DESIGNATION_VALIDATION="Please Select Designation.";
  static const TRAINING_DEPARTMENTS_VALIDATION="Please Select Department.";
  static const TRAINING_ORGANIZATION_VALIDATION="Please Select Organization.";
  static const OLD_PASSWORD = "Please enter your old password";
  static const NEW_PASSWORD = "Please enter your new password";
  static const NEW_CONFIRM_PASSWORD = "Please confirm your new password";
  static const DATE_PICKER = "Pick your Date";


  static validateFormField(value,nullMessage){
    if (value == null || value.isEmpty) {
      return nullMessage;
    } else {
      return null;
    }
  }

  static validatePassword(value,nullMessage,lengthMessage,messageToShow){
    RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (value == null || value.isEmpty) {
      return nullMessage;
    }
    else if(messageToShow == "fromLogin"){
      return null;
    }
    else if(value.length<8){

      return messageToShow;
    }else if(!regex.hasMatch(value)){
      return (messageToShow);
    }
    else {
      return null;
    }
  }

  static validateMobileFormField(value,nullMessage){
    if (value == null || value.isEmpty) {
      return nullMessage;
    }
    else if(!GetUtils.isPhoneNumber(value)) {
      return VALID_MOBILE_VALIDATION_TEXT;
    }
    else {
      // print(!GetUtils.isPhoneNumber(value));
      return null;
    }
  }

  static validateEmailFormField(value,nullMessage){
    if (value == null || value.isEmpty ) {
      return nullMessage;
    }
    else if(!GetUtils.isEmail(value)) {
      return VALID_EMAIL_VALIDATION_TEXT;
    } else {
      return null;
    }
  }

  static validateAmount(value,nullMessage,validation,max){
    if (value == null || value.isEmpty) {
      return nullMessage;
    }
    else if(double.parse(value)>max){
      return validation;
    }
    else {
      return null;
    }
  }


  static validateAmounts(value,nullMessage){
    if (value == null || value.isEmpty) {
      return nullMessage;
    }
    // else if(double.parse(value)>max){
    //   print(value);
    //   return validation;
    // }
    else {
      return null;
    }
  }
}