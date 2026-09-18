import 'package:islami/ui/home/domain/entities/response/azkar/azar_model.dart';
import 'package:islami/ui/home/network/model/response/azkar/azar_model_dto.dart';

extension ToAzkar on AzarModelDto {
  AzarModel azarModel() {
    return AzarModel(
      description: description,
      category: category,
      content: content,
      count: count,
      reference: reference,
    );
  }
}

extension ToAzarList on List<AzarModelDto> {
  List<AzarModel> azarModelList() {
    return map((e) => e.azarModel()).toList();
  }
}

extension ToFutureAzkar on Future<List<AzarModelDto>> {
  Future<List<AzarModel>> future() {
    return then((dtoList) => dtoList.azarModelList());
  }
}
