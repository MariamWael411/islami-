import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:islami/core/network/api/api_constant.dart';
import 'package:islami/core/network/api/end_points.dart';
import 'package:islami/core/network/location/services_location.dart';
import 'package:islami/model/Reciters_responce.dart';
import 'package:islami/model/radio_response.dart';
import 'package:islami/model/time_respose.dart';

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


  static Future<TimeRespose> getPrey() async {
    try {
      String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
      final position = await ServicesLocation.determinePosition();
      final latitude = position.latitude;
      final longitude = position.longitude;
      Uri url = Uri.parse(
          'https://api.aladhan.com/v1/timings/$date?latitude=$latitude&longitude=$longitude&country=egypt');
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return TimeRespose.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
