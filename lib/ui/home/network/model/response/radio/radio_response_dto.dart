import 'package:islami/ui/home/network/model/response/radio/radio_dto.dart';

class RadioResponseDto {
  RadioResponseDto({this.radios});

  RadioResponseDto.fromJson(dynamic json) {
    if (json['radios'] != null) {
      radios = [];
      json['radios'].forEach((v) {
        radios?.add(RadioDto.fromJson(v));
      });
    }
  }

  List<RadioDto>? radios;

  RadioResponseDto copyWith({List<RadioDto>? radios}) =>
      RadioResponseDto(radios: radios ?? this.radios);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (radios != null) {
      map['radios'] = radios?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
