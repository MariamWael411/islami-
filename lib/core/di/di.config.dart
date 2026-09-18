// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../ui/home/data/data_source/local/home_local_data_source.dart'
    as _i22;
import '../../ui/home/data/data_source/local/home_local_data_source_impl.dart'
    as _i715;
import '../../ui/home/data/data_source/remote/home_remote_data_source.dart'
    as _i662;
import '../../ui/home/data/data_source/remote/home_remote_data_source_impl.dart'
    as _i948;
import '../../ui/home/data/repository/home_repository_impl.dart' as _i399;
import '../../ui/home/domain/repository/home_repository.dart' as _i548;
import '../../ui/home/domain/use_case/get_prey_use_case.dart' as _i850;
import '../../ui/home/domain/use_case/get_radio_use_case.dart' as _i959;
import '../../ui/home/domain/use_case/get_reciters_use_case.dart' as _i927;
import '../../ui/home/domain/use_case/load_azkar_morning_use_case.dart'
    as _i1017;
import '../../ui/home/domain/use_case/load_azkar_use_case.dart' as _i266;
import '../../ui/home/domain/use_case/load_hadeth_file_use_case.dart' as _i786;
import '../../ui/home/domain/use_case/load_sura_file2_use_case.dart' as _i640;
import '../../ui/home/domain/use_case/load_sura_file_use_case.dart' as _i608;
import '../../ui/home/domain/use_case/search_by_sura_index_use_case.dart'
    as _i546;
import '../../ui/home/feature/provider/home_provider.dart' as _i1014;
import '../../ui/home/network/api/api_client.dart' as _i137;
import 'get_it_module.dart' as _i1015;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.lazySingleton<_i895.Connectivity>(() => getItModule.provideConnectivity);
    gh.lazySingleton<_i137.ApiClient>(() => _i137.ApiClient());
    gh.factory<_i22.HomeLocalDataSource>(() => _i715.HomeLocalDataSourceImpl());
    gh.factory<_i662.HomeRemoteDataSource>(
      () => _i948.HomeRemoteDataSourceImpl(apiClient: gh<_i137.ApiClient>()),
    );
    gh.factory<_i548.HomeRepository>(
      () => _i399.HomeRepositoryImpl(
        connectivity: gh<_i895.Connectivity>(),
        homeLocalDataSource: gh<_i22.HomeLocalDataSource>(),
        homeRemoteDataSource: gh<_i662.HomeRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i850.GetPreyUseCase>(
      () => _i850.GetPreyUseCase(homeRepository: gh<_i548.HomeRepository>()),
    );
    gh.lazySingleton<_i959.GetRadioUseCase>(
      () => _i959.GetRadioUseCase(homeRepository: gh<_i548.HomeRepository>()),
    );
    gh.lazySingleton<_i927.GetRecitersUseCase>(
      () =>
          _i927.GetRecitersUseCase(homeRepository: gh<_i548.HomeRepository>()),
    );
    gh.lazySingleton<_i1017.LoadAzkarMorningUseCase>(
      () => _i1017.LoadAzkarMorningUseCase(
        homeRepository: gh<_i548.HomeRepository>(),
      ),
    );
    gh.lazySingleton<_i266.LoadAzkarUseCase>(
      () => _i266.LoadAzkarUseCase(homeRepository: gh<_i548.HomeRepository>()),
    );
    gh.lazySingleton<_i786.LoadHadethFileUseCase>(
      () => _i786.LoadHadethFileUseCase(
        homeRepository: gh<_i548.HomeRepository>(),
      ),
    );
    gh.lazySingleton<_i640.LoadSuraFile2UseCase>(
      () => _i640.LoadSuraFile2UseCase(
        homeRepository: gh<_i548.HomeRepository>(),
      ),
    );
    gh.lazySingleton<_i608.LoadSuraFileUseCase>(
      () =>
          _i608.LoadSuraFileUseCase(homeRepository: gh<_i548.HomeRepository>()),
    );
    gh.lazySingleton<_i546.SearchBySuraIndexUseCase>(
      () => _i546.SearchBySuraIndexUseCase(
        homeRepository: gh<_i548.HomeRepository>(),
      ),
    );
    gh.factory<_i1014.HomeProvider>(
      () => _i1014.HomeProvider(
        getRecitersUseCase: gh<_i927.GetRecitersUseCase>(),
        getRadioUseCase: gh<_i959.GetRadioUseCase>(),
        getPreyUseCase: gh<_i850.GetPreyUseCase>(),
        searchBySuraIndexUseCase: gh<_i546.SearchBySuraIndexUseCase>(),
        loadSuraFile2UseCase: gh<_i640.LoadSuraFile2UseCase>(),
        loadSuraFileUseCase: gh<_i608.LoadSuraFileUseCase>(),
        hadethFileUseCase: gh<_i786.LoadHadethFileUseCase>(),
        azkarUseCase: gh<_i266.LoadAzkarUseCase>(),
        azkarMorningUseCase: gh<_i1017.LoadAzkarMorningUseCase>(),
      ),
    );
    return this;
  }
}

class _$GetItModule extends _i1015.GetItModule {}
