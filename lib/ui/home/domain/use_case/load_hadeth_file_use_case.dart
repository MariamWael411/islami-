import 'package:injectable/injectable.dart';
import 'package:islami/ui/home/domain/repository/home_repository.dart';

import '../../network/model/utils/hadeth.dart';

@lazySingleton
class LoadHadethFileUseCase {
  HomeRepository _homeRepository;

  LoadHadethFileUseCase({required this._homeRepository});

  Future<Hadeth> call(int index) {
    return _homeRepository.loadHadeth(index);
  }
}
