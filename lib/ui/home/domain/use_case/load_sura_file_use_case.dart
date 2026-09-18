import 'package:injectable/injectable.dart';
import 'package:islami/ui/home/domain/repository/home_repository.dart';

@lazySingleton
class LoadSuraFileUseCase {
  HomeRepository _homeRepository;

  LoadSuraFileUseCase({required this._homeRepository});

  Future<String> call(int index) {
    return _homeRepository.loadSuraFile(index);
  }
}
