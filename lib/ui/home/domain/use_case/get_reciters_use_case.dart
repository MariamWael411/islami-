import 'package:injectable/injectable.dart';
import 'package:islami/ui/home/domain/entities/response/reciters/reciters_response.dart';
import 'package:islami/ui/home/domain/repository/home_repository.dart';
import 'package:islami/ui/home/network/api/api_result.dart';

@lazySingleton
class GetRecitersUseCase {
  HomeRepository _homeRepository;

  GetRecitersUseCase({required this._homeRepository});

  Future<ApiResult<RecitersResponse>> call() {
    return _homeRepository.getReciters();
  }
}
