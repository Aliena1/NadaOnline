import '../../constants/api_constants/api_constant.dart';
import '../../services/remote_services/remote_services.dart';

class BookingRepository {

  Future<dynamic> getDropdownData() async{
    return await RemoteServices.getMethod(ApiConstants.dropdownData);
  }

  Future<dynamic> getVehicleData() async{
    return await RemoteServices.getMethod(ApiConstants.vehicleData);
  }

  Future<dynamic> postBookingData(map) async{
    return await RemoteServices.postMethod(ApiConstants.postBookingApi, map);
  }

}