import 'package:islami/ui/home/network/api/api_result.dart';

import '../../network/model/utils/hadeth.dart';
import '../entities/response/azkar/azar_model.dart';
import '../entities/response/radio/radio_response.dart';
import '../entities/response/reciters/reciters_response.dart';
import '../entities/response/time/time_response.dart';

abstract class HomeRepository {
  Future<List<String>> loadSuraFile2(int index);

  Future<String> loadSuraFile(int index);

  Future<Hadeth> loadHadeth(int index);

  List<int> searchBySuraName(var text);

  Future<ApiResult<TimeResponse>> getPrey();

  Future<ApiResult<RadioResponse>> getRadio();

  Future<ApiResult<RecitersResponse>> getReciters();

  Future<ApiResult<List<AzarModel>>> loadAzkarContent(String azkarType);

  Future<ApiResult<List<AzarModel>>> loadMorningAzkarContent(String azkarType);
}
