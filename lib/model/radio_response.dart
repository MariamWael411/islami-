import 'radio.dart';

class RadioResponse {
  RadioResponse({this.radios});

  RadioResponse.fromJson(dynamic json) {
    if (json['radios'] != null) {
      radios = [];
      json['radios'].forEach((v) {
        radios?.add(Radios.fromJson(v));
      });
    }
  }

  List<Radios>? radios;

  RadioResponse copyWith({List<Radios>? radios}) =>
      RadioResponse(radios: radios ?? this.radios);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (radios != null) {
      map['radios'] = radios?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
