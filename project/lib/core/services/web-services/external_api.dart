import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project/core/services/web-services/base-api.dart';
import 'package:project/core/services/web-services/nertwork_config.dart';

import '../../models/crypto_response.dart';

class ExternalApiServices {
  Future<List<dynamic>> fetchCryptoPrice()async{
    try{
      Dio dio = Dio();
      var response = await dio.get(NetworkConfig.cryptoPrice);
      List<dynamic> responseData = response.data;
      print(responseData.length);
      return responseData;
    }catch(err){
      handleError(err);
      print(err);
      return [];
    }
  }


  List<Map<String, dynamic>> convertToDesiredList(Map<String, dynamic> data) {
    List<Map<String, dynamic>> resultList = [];
    print(data);

    data.forEach((type, values) {
      Map<String, dynamic> entry = {
        "type": type,
        "values": values
      };
      resultList.add(entry);
    });

    print(jsonEncode(resultList));
    print(resultList);
    return resultList;
  }
}