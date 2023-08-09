import 'dart:convert';
import 'dart:io';


import 'package:dio/dio.dart';

import '../../../constants/constants.dart';
import '../../../locator.dart';
import '../../../ui/widgets/snack_message.dart';
import '../storage-service.dart';
import 'auth.api.dart';
import 'nertwork_config.dart';

StorageService storageService = locator<StorageService>();
AuthenticationApiService auth = locator<AuthenticationApiService>();
String? newToken;

connect() {
  BaseOptions options = BaseOptions(
      baseUrl: NetworkConfig.BASE_URL,
      connectTimeout: const Duration(milliseconds: 100000),
      receiveTimeout: const Duration(milliseconds: 100000),
      responseType: ResponseType.plain);
  Dio dio = Dio(options);
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        print(options.uri.path);
        print(options.data.toString());
        String? value = await storageService.readItem(key: accessToken);
        print(value);
        if (value != null && value.isNotEmpty) {
          options.headers['Authorization'] = "Bearer $value";
        }
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        print(response.data);
        return handler.next(response);
      },
      onError: (DioError e, handler) async {
        print("status code: ${e.message}");
        print("status message: ${e.error}");
        print(e.response?.statusCode);
        print("${e.response?.data.toString()}");
        try {
          handleError(e);
        } on DioError catch (e) {
          showCustomToast(e.response?.data??"");
          return handler.next(e);
        }
        //token is expired
        //log user out
        if (e.response?.statusCode == 401 &&
            jsonDecode(e.response!.data)['detail'] != null &&
            jsonDecode(e.response!.data)['detail']
                .toString()
                .contains("token")) {
          await storageService.storage.deleteAll();
          // locator<NavigationService>().navigateToAndRemoveUntil(LoginRoute);
        }
        return handler.next(e);
      },
    ),
  );

  return dio;
}

// Future<bool> refreshAuthToken() async {
//   final refreshToken_ = await storageService.readItem(key: refreshToken);
//   try {
//     Response response = await connect()
//         .post('api/v1/auth/token/refresh/', data: {'refresh': refreshToken_});
//
//     if (response.statusCode == 201 || response.statusCode == 200) {
//       print('refresh token went through');
//       print("result : ${response.data}");
//       newToken = jsonDecode(response.data)['access'];
//       storageService.storeItem(
//           key: accessToken, value: jsonDecode(response.data)['access']);
//
//       return true;
//     } else if (response.statusCode == 401) {
//       print('refreshAuthToken');
//       return false;
//     } else {
//       print('refresh token is wrong');
//       storageService.deleteItem(key: refreshToken);
//       storageService.deleteItem(key: accessToken);
//
//       return false;
//     }
//   } catch (e) {
//     return false;
//   }
// }

// Future _retry(RequestOptions requestOptions) async {
//   final options = Options(
//       method: requestOptions.method,
//       headers: {HttpHeaders.authorizationHeader: 'Bearer $newToken'});
//
//   return connect().request(requestOptions.path,
//       data: requestOptions.data,
//       queryParameters: requestOptions.queryParameters,
//       options: options);
// }

Future<void> handleError(dynamic error) async {
  var errorString = error.response.toString();
  if (error is DioError) {
    switch (error.type) {
      case DioExceptionType.cancel:
        showCustomToast("Request to API server was cancelled");
        break;
      case DioExceptionType.connectionTimeout:
        showCustomToast("Connection timeout with API server");
        // break;
        return;
      case DioExceptionType.unknown:
        showCustomToast("Connection to API server failed due to internet connection");
        break;
      case DioExceptionType.receiveTimeout:
        showCustomToast("Receive timeout in connection with API server");
        break;
      case DioExceptionType.badResponse:
        var errorMessage =error.response!.data;


        if(errorMessage=='{"error":"Authentication Failed"}'){
          storageService.deleteAllItems();
          // await sharedPreference.logout();
          // await navigationService.navigateToAndRemoveUntil(AppRoutes.account);
          break;
        }
        // else if(error.response!.data=="Server error"||error.response!.data=="Internal Server error"){
        //   errorMessage ="Server error";
        // }
        else if(jsonDecode(error.response!.data.toString())["detail"]!=null){
          errorMessage =  jsonDecode(error.response!.data.toString())["detail"];
          print("Here!!!");
          // Check if the value is a string
          if (errorMessage is String) {
            showCustomToast(errorMessage);
            break;
          } else {
            print(errorMessage[0]['msg']);
            showCustomToast(errorMessage[0]['msg']);
            break;
          }
        }else{
          errorMessage = error.response.toString();
          break;
        }
      case DioErrorType.sendTimeout:
        showCustomToast("Send timeout in connection with API server");
        break;
      default:
        showCustomToast("Something went wrong");
        break;
    }
  } else {
    var json = jsonDecode(errorString);
    var nameJson = json['message'];
    showCustomToast(nameJson);
    throw nameJson;
  }
}
