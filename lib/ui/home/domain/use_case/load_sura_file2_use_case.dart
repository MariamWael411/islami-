import 'package:injectable/injectable.dart';
import 'package:islami/ui/home/domain/repository/home_repository.dart';

@lazySingleton
class LoadSuraFile2UseCase {
  HomeRepository _homeRepository;

  LoadSuraFile2UseCase({required this._homeRepository});

  Future<List<String>> call(int index) {
    return _homeRepository.loadSuraFile2(index);
  }
}
