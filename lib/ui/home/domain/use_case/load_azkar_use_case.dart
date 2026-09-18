import 'package:injectable/injectable.dart';
import 'package:islami/ui/home/domain/entities/response/azkar/azar_model.dart';
import 'package:islami/ui/home/domain/repository/home_repository.dart';

import '../../network/api/api_result.dart';

@lazySingleton
class LoadAzkarUseCase {
  HomeRepository _homeRepository;

  LoadAzkarUseCase({required this._homeRepository});

  Future<ApiResult<List<AzarModel>>> call(String azkarType) {
    return _homeRepository.loadAzkarContent(azkarType);
  }
}
