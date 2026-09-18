import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/error/app_error.dart';
import 'package:islami/ui/home/data/data_source/local/home_local_data_source.dart';
import 'package:islami/ui/home/network/model/response/azkar/azar_model_dto.dart';
import 'package:islami/ui/home/network/model/utils/hadeth.dart';

import '../../../network/api/api_result.dart';
import '../../../network/model/utils/model_app.dart';

@Injectable(as: HomeLocalDataSource)
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<ApiResult<List<AzarModelDto>>> loadAzkarContent(
    String azkarType,
  ) async {
    try {
      var jsonContent = jsonDecode(
        await rootBundle.loadString("assets/azar/azkar.json"),
      );
      List<AzarModelDto> azkar = (jsonContent[azkarType] as List)
          .map((azkarModel) => AzarModelDto.fromJson(azkarModel))
          .toList();
      return SuccessApiResult(data: azkar);
    } catch (e) {
      return ErrorApiResult(errorMessage: UnKnownError());
    }
  }

  @override
  Future<Hadeth> loadHadeth(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/hadeth/h${index + 1}.txt',
    );
    int pattern = fileContent.indexOf('\n');
    String title = fileContent.substring(0, pattern);
    String content = fileContent.substring(pattern + 1);
    var hadeth = Hadeth(title: title, content: content);
    return hadeth;
  }

  @override
  Future<String> loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/utils/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[ ${i + 1} ]';
    }
    var verse = lines.join('');
    return verse;
  }

  Future<List<String>> loadSuraFile2(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/utils/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    var verses = lines;
    return verses;
  }

  @override
  List<int> searchBySuraName(var text) {
    List<int> search = [];
    for (int i = 0; i < ModelApp.englishQuranSurahs.length; i++) {
      if (ModelApp.englishQuranSurahs[i].toLowerCase().contains(
        text.toLowerCase(),
      )) {
        search.add(i);
      }
      if (ModelApp.arabicAuranSuras[i].contains(text)) {
        search.add(i);
      }
    }
    return search;
  }

  @override
  Future<ApiResult<List<AzarModelDto>>> loadAzkarMorningContent(
    String azkarType,
  ) async {
    try {
      var jsonContent = jsonDecode(
        await rootBundle.loadString("assets/azar/azkar.json"),
      );
      List<AzarModelDto> azkar = (jsonContent[azkarType] as List)
          .map((azkarModel) => AzarModelDto.fromJson(azkarModel))
          .toList();
      return SuccessApiResult(data: azkar);
    } catch (e) {
      return ErrorApiResult(errorMessage: UnKnownError());
    }
  }
}
