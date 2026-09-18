import 'reciters_dto.dart';

class RecitersResponseDto {
  RecitersResponseDto({this.reciters});

  RecitersResponseDto.fromJson(dynamic json) {
    if (json['reciters'] != null) {
      reciters = [];
      json['reciters'].forEach((v) {
        reciters?.add(RecitersDto.fromJson(v));
      });
    }
  }

  List<RecitersDto>? reciters;

  RecitersResponseDto copyWith({List<RecitersDto>? reciters}) =>
      RecitersResponseDto(reciters: reciters ?? this.reciters);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (reciters != null) {
      map['reciters'] = reciters?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
