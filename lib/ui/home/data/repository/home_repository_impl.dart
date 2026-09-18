import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/error/app_error.dart';
import 'package:islami/core/utils/connectivity_extention.dart';
import 'package:islami/ui/home/data/data_source/local/home_local_data_source.dart';
import 'package:islami/ui/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:islami/ui/home/data/mappers/to_azkar.dart';
import 'package:islami/ui/home/data/mappers/to_radio_response.dart';
import 'package:islami/ui/home/data/mappers/to_reciters_response.dart';
import 'package:islami/ui/home/data/mappers/to_time_response.dart';
import 'package:islami/ui/home/domain/entities/response/azkar/azar_model.dart';
import 'package:islami/ui/home/domain/entities/response/radio/radio_response.dart';
import 'package:islami/ui/home/domain/entities/response/reciters/reciters_response.dart';
import 'package:islami/ui/home/domain/entities/response/time/time_response.dart';
import 'package:islami/ui/home/domain/repository/home_repository.dart';
import 'package:islami/ui/home/network/api/api_result.dart';

import '../../network/model/utils/hadeth.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource _homeRemoteDataSource;
  HomeLocalDataSource _homeLocalDataSource;
  Connectivity _connectivity;

  HomeRepositoryImpl({
    required this._connectivity,
    required this._homeLocalDataSource,
    required this._homeRemoteDataSource,
  });

  @override
  Future<ApiResult<TimeResponse>> getPrey() async {
    if (await _connectivity.isConnected()) {
      var apiResult = await _homeRemoteDataSource.getPrey();
      if (apiResult.isSuccess) {
        return SuccessApiResult(data: apiResult.getData.toTimeResponse());
      } else {
        return ErrorApiResult(
          errorMessage: ServerError(error: apiResult.getError.error),
        );
      }
    } else {
      return ErrorApiResult(errorMessage: NetworkError());
    }
  }

  @override
  Future<ApiResult<RadioResponse>> getRadio() async {
    if (await _connectivity.isConnected()) {
      var apiResult = await _homeRemoteDataSource.getRadio();
      if (apiResult.isSuccess) {
        return SuccessApiResult(data: apiResult.getData.toRadioResponse());
      } else {
        return ErrorApiResult(
          errorMessage: ServerError(error: apiResult.getError.error),
        );
      }
    } else {
      return ErrorApiResult(errorMessage: NetworkError());
    }
  }

  @override
  Future<ApiResult<RecitersResponse>> getReciters() async {
    if (await _connectivity.isConnected()) {
      var apiResult = await _homeRemoteDataSource.getReciters();
      if (apiResult.isSuccess) {
        return SuccessApiResult(data: apiResult.getData.toReciterResponse());
      } else {
        return ErrorApiResult(
          errorMessage: ServerError(error: apiResult.getError.error),
        );
      }
    } else {
      return ErrorApiResult(errorMessage: NetworkError());
    }
  }

  @override
  Future<String> loadSuraFile(int index) {
    return _homeLocalDataSource.loadSuraFile(index);
  }

  @override
  Future<List<String>> loadSuraFile2(int index) {
    return _homeLocalDataSource.loadSuraFile2(index);
  }

  @override
  List<int> searchBySuraName(var text) {
    return _homeLocalDataSource.searchBySuraName(text);
  }

  @override
  Future<Hadeth> loadHadeth(int index) {
    return _homeLocalDataSource.loadHadeth(index);
  }

  @override
  Future<ApiResult<List<AzarModel>>> loadAzkarContent(String azkarType) async {
    var response = await _homeLocalDataSource.loadAzkarContent(azkarType);
    if (response.isSuccess) {
      return SuccessApiResult(data: response.getData.azarModelList());
    } else {
      return ErrorApiResult(
        errorMessage: UnKnownError(error: response.getError.error),
      );
    }
  }

  @override
  Future<ApiResult<List<AzarModel>>> loadMorningAzkarContent(
    String azkarType,
  ) async {
    var response = await _homeLocalDataSource.loadAzkarMorningContent(
      azkarType,
    );
    if (response.isSuccess) {
      return SuccessApiResult(data: response.getData.azarModelList());
    } else {
      return ErrorApiResult(
        errorMessage: UnKnownError(error: response.getError.error),
      );
    }
  }
}
