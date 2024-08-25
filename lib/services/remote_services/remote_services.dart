import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../constants/api_constants/api_constant.dart';
import '../../constants/app_strings.dart';
import '../../helper/connection/connection.dart';


class RemoteServices {
  static const int TIME_OUT_DURATION = 20;
  static var client=http.Client();

  static Future<dynamic> MultiPartPost(String url,File? file) async {
    try {
      var request = http.MultipartRequest(
        'POST', Uri.parse(ApiConstants.BASE_URL+ApiConstants.VERSION_URL+url),

      );
      Map<String,String> headers={
        "Authorization":ApiConstants.TOKEN_TYPE.toString()+ApiConstants.TOKEN.toString(),
        "Content-type": "multipart/form-data",
        "Accept":"application/json"
      };
      // print("object");
      request.files.add(
        await http.MultipartFile.fromPath(
            "pp_image",
            file!.path
        ),
      );
      // print("object");
      request.headers.addAll(headers);
      var res = await request.send();
      http.Response response = await http.Response.fromStream(res);
      return _processResponse(response);

    }
    on SocketException {
      throw Exception(AppStrings.noInternetConnection);
    } on TimeoutException {
      if(Get.isDialogOpen!) Get.back();
      throw Get.defaultDialog(
        title: "TimeOutException",
        middleText: AppStrings.requestTimedOut,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<dynamic> postResultMethod(String url, dynamic map) async {
    var body = jsonEncode(map);
    try {
      var response = await http
          .post(Uri.parse(ApiConstants.BASE_URL_RESULT  + url),
          headers: <String, String>{
            'Authorization': '${ApiConstants.TOKEN_TYPE} ${ApiConstants.TOKEN}',
            'Content-Type': 'application/json; charset=UTF-8',
            "Accept": "application/json"
          },
          body: body)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      // print('get status = ${response.body}');


      return _processResponse(response);
    } on SocketException {
      throw Exception(AppStrings.noInternetConnection);
    } on TimeoutException {
      if(Get.isDialogOpen!) Get.back();
      throw Get.defaultDialog(
        title: "TimeOutException",
        middleText: AppStrings.requestTimedOut,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<dynamic> postMethod(
      String url, dynamic map) async {
    var body = jsonEncode(map);
    try {
      var response = await http
          .post(Uri.parse(ApiConstants.BASE_URL + ApiConstants.VERSION_URL + url),
          headers: <String, String>{
            'Authorization': '${ApiConstants.TOKEN_TYPE} ${ApiConstants.TOKEN}',
            'Content-Type': 'application/json; charset=UTF-8',
            "Accept": "application/json"
          },
          body: body)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      print('get req = ${response.request}');
      print('get status = ${response.body}');


      return _processResponse(response);
    } on SocketException {
      throw Exception(AppStrings.noInternetConnection);
    } on TimeoutException {
      if(Get.isDialogOpen!) Get.back();
      throw Get.defaultDialog(
        title: "TimeOutException",
        middleText: AppStrings.requestTimedOut,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }





  static Future<dynamic> postMethodWithParameter(
      String url, dynamic map,id) async {
    var body = jsonEncode(map);
    try {

      var response = await http
          .post(Uri.parse("${ApiConstants.BASE_URL + ApiConstants.VERSION_URL+ url}/$id"),
          headers: <String, String>{
            'Authorization': '${ApiConstants.TOKEN_TYPE} ${ApiConstants.TOKEN}',
            'Content-Type': 'application/json; charset=UTF-8',
            "Accept":"application/json"
          },
          body: body)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));

      return _processResponse(response);
    } on SocketException {
      throw Exception(AppStrings.noInternetConnection);
    } on TimeoutException {
      if(Get.isDialogOpen!) Get.back();
      throw Get.defaultDialog(
        title: "TimeOutException",
        middleText: AppStrings.requestTimedOut,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  static Future<dynamic> getByIdMethod(String url,id) async{
    try{

      var response = await http
          .get(Uri.parse("${ApiConstants.BASE_URL + ApiConstants.VERSION_URL+ url}/$id"),headers: {
        'Authorization': '${ApiConstants.TOKEN_TYPE} ${ApiConstants.TOKEN}',
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json"
      })
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    }on SocketException {
      throw Exception(AppStrings.noInternetConnection);
    } on TimeoutException {
      if(Get.isDialogOpen!) Get.back();
      throw
      Get.defaultDialog(
        title: "TimeOutException",
        middleText: AppStrings.requestTimedOut,
      );
    }
    catch(e){
      throw Exception(e.toString());
    }
  }


  static Future<dynamic> getMethodWithParams(String url,queryParameters) async{
    try{

      var response = await http
          .get(Uri.parse(ApiConstants.BASE_URL+ ApiConstants.VERSION_URL + url).replace(queryParameters: queryParameters),headers: {
        'Authorization': 'Bearer ${ApiConstants.TOKEN}',
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json"
      })
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      print('get request = ${response.request}');
      // print('get request = ${response.body}');

      return _processResponse(response);
    }on SocketException {
      throw Exception(AppStrings.noInternetConnection);
    }
    catch(e){
      throw Exception(e.toString());
    }
  }


  static Future<dynamic> getMethod(String url) async{
    try{

      var response = await http
          .get(Uri.parse(url),
          headers: {
        'Authorization': 'Bearer ${ApiConstants.TOKEN}',
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json"
      })
          .timeout(const Duration(seconds: TIME_OUT_DURATION));

      return _processResponse(response);
    }on SocketException {
      throw Exception(AppStrings.noInternetConnection);
    } on TimeoutException {
      if(Get.isDialogOpen!) Get.back();
      throw
      Get.defaultDialog(
        title: "TimeOutException",
        middleText: AppStrings.requestTimedOut,
      );
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

  static Future<dynamic> getMethodWithParamsForex(String url,queryParameters) async{
    try{

      var response = await http
          .get(Uri.parse(url).replace(queryParameters: queryParameters),headers: {
        'Authorization': '${ApiConstants.TOKEN_TYPE} ${ApiConstants.TOKEN}',
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json"
      })
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      // print('get request = ${response.request}');

        return _processResponse(response);
    }on SocketException {
      throw Exception(AppStrings.noInternetConnection);
    } on TimeoutException {
      if(Get.isDialogOpen!) Get.back();
      throw
      Get.defaultDialog(
        title: "Request Time Out",
        middleText: AppStrings.requestTimedOut,
      );
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

}

dynamic _processResponse(http.Response response) {

  switch (response.statusCode) {
  case 200:
  return jsonDecode(response.body);
    case 201:
      return jsonDecode(response.body);
    case 400:
      return jsonDecode(response.body);
    case 401:
      return jsonDecode(response.body);
    case 422:
      return jsonDecode(response.body);
    case 443:
      // print('exception time out');
      // NoJobAvailable(message: AppStrings.noInternetConnection);
      throw Exception(AppStrings.requestTimedOut);
    case 500:
      throw ("Server Error");
    default:
      throw ("Not Successful");
  }
}

