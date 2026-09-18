import 'package:injectable/injectable.dart';
import 'package:islami/ui/home/domain/entities/response/radio/radio_response.dart';
import 'package:islami/ui/home/domain/repository/home_repository.dart';
import 'package:islami/ui/home/network/api/api_result.dart';

@lazySingleton
class GetRadioUseCase {
  HomeRepository _homeRepository;

  GetRadioUseCase({required this._homeRepository});

  Future<ApiResult<RadioResponse>> call() {
    return _homeRepository.getRadio();
  }
}
