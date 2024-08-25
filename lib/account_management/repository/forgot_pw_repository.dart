import '../../constants/api_constants/api_constant.dart';
import '../../services/remote_services/remote_services.dart';

class ForgotPwRepository{
  // Future<dynamic> forgotPw(map) async{
  //   return await RemoteServices.postMethod(ApiConstants.forgotPwApi, map);
  // }
  // Future<dynamic> forgotPwOtp(map) async{
  //   return await RemoteServices.postMethod(ApiConstants.forgotPwOtpApi, map);
  // }
  // Future<dynamic> forgotPwReset(map) async{
  //   return await RemoteServices.postMethod(ApiConstants.changePwApi, map);
  // }
  Future<dynamic> resendOtp(map) async{
    // return await RemoteServices.postMethod(ApiConstants.resendForgotPwApi, map);
  }

  Future<dynamic> passwordReset(map) async{
    // return await RemoteServices.postMethod(ApiConstants.changePwApi, map);
  }
}