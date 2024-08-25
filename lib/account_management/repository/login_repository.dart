import '../../constants/api_constants/api_constant.dart';
import '../../services/remote_services/remote_services.dart';

class LoginRepository{
  Future<dynamic> login(map) async{
    return await RemoteServices.postMethod(ApiConstants.LOGIN, map);
  }
}