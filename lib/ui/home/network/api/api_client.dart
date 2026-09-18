import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:islami/ui/home/network/model/response/radio/radio_response_dto.dart';
import 'package:islami/ui/home/network/model/response/reciters/reciters_response_dto.dart';
import 'package:islami/ui/home/network/model/response/time/time_response_dto.dart';

import '../location/services_location.dart';
import 'api_constant.dart';
import 'end_points.dart';


@lazySingleton
class ApiClient {
  Future<RecitersResponseDto> getReciters() async {
    try {
      //https://www.mp3quran.net/api/v3/reciters?language=ar
      Uri url = Uri.https(ApiConstant.serverName, EndPoints.reciterEndPoint, {
        'language': 'ar',
      });
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return RecitersResponseDto.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  Future<RadioResponseDto> getRadio() async {
    try {
      //https://mp3quran.net/api/v3/radios?language=ar
      Uri url = Uri.https(ApiConstant.serverName, EndPoints.radioEndPoint, {
        'language': 'ar',
      });
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return RadioResponseDto.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }


  Future<TimeResponseDto> getPrey() async {
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
      return TimeResponseDto.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
