import '../../constants/api_constants/api_constant.dart';
import '../../services/remote_services/remote_services.dart';

class OtpRepository{
  Future<dynamic> otp(map) async{
    // return await RemoteServices.postMethod(ApiConstants.verifyOtpApi, map);
  }

  Future<dynamic> resendOtp(map) async{
    // return await RemoteServices.postMethod(ApiConstants.resendOtpApi, map);
  }


}