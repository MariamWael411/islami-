import 'data.dart';

class TimeRespose {
  TimeRespose({this.code, this.status, this.data});

  TimeRespose.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  num? code;
  String? status;
  Data? data;

  TimeRespose copyWith({num? code, String? status, Data? data}) => TimeRespose(
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
