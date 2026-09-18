import 'package:islami/ui/home/network/model/response/time/data_dto.dart';

class TimeResponseDto {
  TimeResponseDto({this.code, this.status, this.data});

  TimeResponseDto.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? DataDto.fromJson(json['data']) : null;
  }

  num? code;
  String? status;
  DataDto? data;

  TimeResponseDto copyWith({num? code, String? status, DataDto? data}) =>
      TimeResponseDto(
        code: code ?? this.code,
        status: status ?? this.status,
    data: data ?? this.data,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}
