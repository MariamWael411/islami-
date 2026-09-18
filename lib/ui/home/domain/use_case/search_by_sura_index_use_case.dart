import 'package:injectable/injectable.dart';
import 'package:islami/ui/home/domain/repository/home_repository.dart';

@lazySingleton
class SearchBySuraIndexUseCase {
  HomeRepository _homeRepository;

  SearchBySuraIndexUseCase({required this._homeRepository});

  List<int> call(var text) {
    return _homeRepository.searchBySuraName(text);
  }
}
