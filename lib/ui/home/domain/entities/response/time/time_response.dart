import 'data.dart';

class TimeResponse {
  TimeResponse({this.code, this.status, this.data});

  TimeResponse.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  num? code;
  String? status;
  Data? data;

  TimeResponse copyWith({num? code, String? status, Data? data}) =>
      TimeResponse(
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
