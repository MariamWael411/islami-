import 'package:islami/ui/home/network/model/response/time/params_dto.dart';

import 'location_dto.dart';

class MethodDto {
  MethodDto({this.id, this.name, this.params, this.location});

  MethodDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    params = json['params'] != null ? ParamsDto.fromJson(json['params']) : null;
    location = json['location'] != null
        ? LocationDto.fromJson(json['location'])
        : null;
  }

  num? id;
  String? name;
  ParamsDto? params;
  LocationDto? location;

  MethodDto copyWith({
    num? id,
    String? name,
    ParamsDto? params,
    LocationDto? location,
  }) => MethodDto(
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
