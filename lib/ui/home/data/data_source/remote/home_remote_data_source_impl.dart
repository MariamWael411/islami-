import 'package:injectable/injectable.dart';
import 'package:islami/core/error/app_error.dart';
import 'package:islami/ui/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:islami/ui/home/network/api/api_client.dart';
import 'package:islami/ui/home/network/model/response/radio/radio_response_dto.dart';
import 'package:islami/ui/home/network/model/response/reciters/reciters_response_dto.dart';
import 'package:islami/ui/home/network/model/response/time/time_response_dto.dart';

import '../../../network/api/api_result.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiClient _apiClient;

  HomeRemoteDataSourceImpl({required this._apiClient});

  @override
  Future<ApiResult<TimeResponseDto>> getPrey() async {
    try {
      var response = await _apiClient.getPrey();
      if (response.status == 'OK') {
        return SuccessApiResult(data: response);
      } else {
        return ErrorApiResult(errorMessage: ServerError());
      }
    } catch (e) {
      return ErrorApiResult(errorMessage: UnKnownError());
    }
  }

  @override
  Future<ApiResult<RadioResponseDto>> getRadio() async {
    try {
      var response = await _apiClient.getRadio();
      return SuccessApiResult(data: response);
    } catch (e) {
      return ErrorApiResult(errorMessage: UnKnownError(error: e.toString()));
    }
  }

  @override
  Future<ApiResult<RecitersResponseDto>> getReciters() async {
    try {
      var response = await _apiClient.getReciters();
      return SuccessApiResult(data: response);
    } catch (e) {
      return ErrorApiResult(errorMessage: UnKnownError(error: e.toString()));
    }
  }
}
