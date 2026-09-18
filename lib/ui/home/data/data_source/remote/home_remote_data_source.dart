import 'package:islami/ui/home/network/model/response/radio/radio_response_dto.dart';
import 'package:islami/ui/home/network/model/response/reciters/reciters_response_dto.dart';
import 'package:islami/ui/home/network/model/response/time/time_response_dto.dart';

import '../../../network/api/api_result.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResult<RecitersResponseDto>> getReciters();

  Future<ApiResult<RadioResponseDto>> getRadio();

  Future<ApiResult<TimeResponseDto>> getPrey();
}
