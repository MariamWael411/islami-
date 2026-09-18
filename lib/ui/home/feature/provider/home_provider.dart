import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/ui/common/utils/resource.dart';
import 'package:islami/ui/home/domain/entities/response/azkar/azar_model.dart';
import 'package:islami/ui/home/domain/entities/response/radio/radio_response.dart';
import 'package:islami/ui/home/domain/entities/response/reciters/reciters_response.dart';
import 'package:islami/ui/home/domain/entities/response/time/time_response.dart';
import 'package:islami/ui/home/domain/use_case/get_prey_use_case.dart';
import 'package:islami/ui/home/domain/use_case/get_radio_use_case.dart';
import 'package:islami/ui/home/domain/use_case/get_reciters_use_case.dart';
import 'package:islami/ui/home/domain/use_case/load_azkar_morning_use_case.dart';
import 'package:islami/ui/home/domain/use_case/load_azkar_use_case.dart';
import 'package:islami/ui/home/domain/use_case/load_hadeth_file_use_case.dart';
import 'package:islami/ui/home/domain/use_case/load_sura_file2_use_case.dart';
import 'package:islami/ui/home/domain/use_case/load_sura_file_use_case.dart';
import 'package:islami/ui/home/domain/use_case/search_by_sura_index_use_case.dart';
import 'package:islami/ui/home/network/model/utils/hadeth.dart';

@injectable
class HomeProvider extends ChangeNotifier {
  GetPreyUseCase _getPreyUseCase;
  GetRadioUseCase _getRadioUseCase;
  GetRecitersUseCase _getRecitersUseCase;
  LoadAzkarUseCase _azkarUseCase;
  LoadHadethFileUseCase _hadethFileUseCase;
  LoadSuraFileUseCase _loadSuraFileUseCase;
  LoadSuraFile2UseCase _loadSuraFile2UseCase;
  SearchBySuraIndexUseCase _searchBySuraIndexUseCase;
  LoadAzkarMorningUseCase _azkarMorningUseCase;

  HomeProvider({
    required this._getRecitersUseCase,
    required this._getRadioUseCase,
    required this._getPreyUseCase,
    required this._searchBySuraIndexUseCase,
    required this._loadSuraFile2UseCase,
    required this._loadSuraFileUseCase,
    required this._hadethFileUseCase,
    required this._azkarUseCase,
    required this._azkarMorningUseCase,
  });

  Resource<TimeResponse> apiTime = Resource.initial();
  Resource<RadioResponse> apiRadio = Resource.initial();
  Resource<RecitersResponse> apiReciters = Resource.initial();
  Resource<List<AzarModel>> apiAzkar = Resource.initial();
  Resource<List<AzarModel>> apiMorningAzkar = Resource.initial();

  Future<void> loadTime() async {
    apiTime = Resource.loading();
    notifyListeners();
    var response = await _getPreyUseCase();
    if (response.isSuccess) {
      apiTime = Resource.success(data: response.getData);
      notifyListeners();
    } else {
      apiTime = Resource.error(errorMessage: response.getError.error);
      notifyListeners();
    }
  }

  Future<void> loadRadio() async {
    apiRadio = Resource.loading();
    notifyListeners();
    var response = await _getRadioUseCase();
    if (response.isSuccess) {
      apiRadio = Resource.success(data: response.getData);
      notifyListeners();
    } else {
      apiRadio = Resource.error(errorMessage: response.getError.error);
      notifyListeners();
    }
  }

  Future<void> loadReciters() async {
    apiReciters = Resource.loading();
    notifyListeners();
    var response = await _getRecitersUseCase();
    if (response.isSuccess) {
      apiReciters = Resource.success(data: response.getData);
      notifyListeners();
    } else {
      apiReciters = Resource.error(errorMessage: response.getError.error);
      notifyListeners();
    }
  }

  Future<void> loadAzar(String azkarType) async {
    apiAzkar = Resource.loading();
    notifyListeners();
    var response = await _azkarUseCase(azkarType);
    if (response.isSuccess) {
      apiAzkar = Resource.success(data: response.getData);
      notifyListeners();
    } else {
      apiAzkar = Resource.error(errorMessage: response.getError.error);
      notifyListeners();
    }
  }

  Future<void> loadMorningAzar(String azkarType) async {
    apiMorningAzkar = Resource.loading();
    notifyListeners();
    var response = await _azkarMorningUseCase(azkarType);
    if (response.isSuccess) {
      apiMorningAzkar = Resource.success(data: response.getData);
      notifyListeners();
    } else {
      apiMorningAzkar = Resource.error(errorMessage: response.getError.error);
      notifyListeners();
    }
  }

  Future<Hadeth> loadHadth(int index) {
    return _hadethFileUseCase(index);
  }

  Future<String> loadSuraFile(int index) {
    return _loadSuraFileUseCase(index);
  }

  Future<List<String>> loadSuraFile2(int index) {
    return _loadSuraFile2UseCase(index);
  }

  List<int> searchBySuraIndex(dynamic text) {
    return _searchBySuraIndexUseCase(text);
  }
}
