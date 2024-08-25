import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionChecker{
  static Future<dynamic> isInternet() async{
    // var connectivityResult=await (Connectivity().checkConnectivity());
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    bool result = await InternetConnectionChecker().hasConnection;

    if(connectivityResult.contains(ConnectivityResult.mobile) && result == true){
        // print("Mobile data detected & internet connection confirmed");
        return true;
    }
    else if(connectivityResult.contains(ConnectivityResult.wifi) && result == true){
        // print("Wifi data detected & internet connection confirmed");
        return true;
      }
      else{
        // print("no connection");
        return false;
      }
  }
}