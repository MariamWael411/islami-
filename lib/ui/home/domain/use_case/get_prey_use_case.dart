import 'package:injectable/injectable.dart';
import 'package:islami/ui/home/domain/entities/response/time/time_response.dart';
import 'package:islami/ui/home/domain/repository/home_repository.dart';
import 'package:islami/ui/home/network/api/api_result.dart';

@lazySingleton
class GetPreyUseCase {
  HomeRepository _homeRepository;

  GetPreyUseCase({required this._homeRepository});

  Future<ApiResult<TimeResponse>> call() {
    return _homeRepository.getPrey();
  }
}
