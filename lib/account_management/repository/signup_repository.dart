import '../../constants/api_constants/api_constant.dart';
import '../../services/remote_services/remote_services.dart';

class SignUpRepository{
  Future<dynamic> signUp(map) async{
    // return await RemoteServices.postMethod(ApiConstants.signUpApi, map);
  }

  Future<dynamic> getDataSignUp() async{
    // return await RemoteServices.getMethod(ApiConstants.signUpDataApi);
  }
}