import 'package:islami/model/params.dart';

import 'location.dart';

class Method {
  Method({this.id, this.name, this.params, this.location});

  Method.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    params = json['params'] != null ? Params.fromJson(json['params']) : null;
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
  }

  num? id;
  String? name;
  Params? params;
  Location? location;

  Method copyWith({
    num? id,
    String? name,
    Params? params,
    Location? location,
  }) => Method(
    id: id ?? this.id,
    name: name ?? this.name,
    params: params ?? this.params,
    location: location ?? this.location,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (params != null) {
      map['params'] = params?.toJson();
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    return map;
  }
}
