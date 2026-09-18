import 'package:islami/ui/home/domain/entities/response/radio/radio.dart';
import 'package:islami/ui/home/domain/entities/response/radio/radio_response.dart';
import 'package:islami/ui/home/network/model/response/radio/radio_dto.dart';
import 'package:islami/ui/home/network/model/response/radio/radio_response_dto.dart';

extension ToRadioResponse on RadioResponseDto {
  RadioResponse toRadioResponse() {
    return RadioResponse(radios: radios?.toRadioList());
  }
}

extension ToRadio on RadioDto {
  Radio toRadio() {
    return Radio(name: name, id: id, recentDate: recentDate, url: url);
  }
}

extension ToRadioList on List<RadioDto> {
  List<Radio> toRadioList() {
    return map((e) => e.toRadio()).toList();
  }
}
