import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami/core/network/api/api_constant.dart';
import 'package:islami/core/network/api/end_points.dart';
import 'package:islami/model/Reciters_responce.dart';
import 'package:islami/model/radio_response.dart';

class ApiClient {
  static Future<RecitersResponce> getReciters() async {
    try {
      //https://www.mp3quran.net/api/v3/reciters?language=ar
      Uri url = Uri.https(ApiConstant.serverName, EndPoints.reciterEndPoint, {
        'language': 'ar',
      });
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return RecitersResponce.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<RadioResponse> getRadio() async {
    try {
      //https://mp3quran.net/api/v3/radios?language=ar
      Uri url = Uri.https(ApiConstant.serverName, EndPoints.radioEndPoint, {
        'language': 'ar',
      });
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return RadioResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
