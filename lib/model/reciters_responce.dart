import 'reciters.dart';

class RecitersResponce {
  RecitersResponce({this.reciters});

  RecitersResponce.fromJson(dynamic json) {
    if (json['reciters'] != null) {
      reciters = [];
      json['reciters'].forEach((v) {
        reciters?.add(Reciters.fromJson(v));
      });
    }
  }

  List<Reciters>? reciters;

  RecitersResponce copyWith({List<Reciters>? reciters}) =>
      RecitersResponce(reciters: reciters ?? this.reciters);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (reciters != null) {
      map['reciters'] = reciters?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
