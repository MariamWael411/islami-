import 'package:islami/ui/home/network/model/response/azkar/azar_model_dto.dart';

import '../../../network/api/api_result.dart';
import '../../../network/model/utils/hadeth.dart';

abstract class HomeLocalDataSource {
  Future<List<String>> loadSuraFile2(int index);

  Future<String> loadSuraFile(int index);

  Future<Hadeth> loadHadeth(int index);

  Future<ApiResult<List<AzarModelDto>>> loadAzkarContent(String azkarType);

  Future<ApiResult<List<AzarModelDto>>> loadAzkarMorningContent(
    String azkarType,
  );

  List<int> searchBySuraName(var text);
}
