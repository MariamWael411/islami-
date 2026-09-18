import 'method_dto.dart';
import 'offest_dto.dart';

class MetaDto {
  MetaDto({
    this.latitude,
    this.longitude,
    this.timezone,
    this.method,
    this.latitudeAdjustmentMethodDto,
    this.midnightMode,
    this.school,
    this.offset,
  });

  MetaDto.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    timezone = json['timezone'];
    method = json['method'] != null ? MethodDto.fromJson(json['method']) : null;
    latitudeAdjustmentMethodDto = json['latitudeAdjustmentMethodDto'];
    midnightMode = json['midnightMode'];
    school = json['school'];
    offset = json['offset'] != null ? OffsetDto.fromJson(json['offset']) : null;
  }

  num? latitude;
  num? longitude;
  String? timezone;
  MethodDto? method;
  String? latitudeAdjustmentMethodDto;
  String? midnightMode;
  String? school;
  OffsetDto? offset;

  MetaDto copyWith({
    num? latitude,
    num? longitude,
    String? timezone,
    MethodDto? method,
    String? latitudeAdjustmentMethodDto,
    String? midnightMode,
    String? school,
    OffsetDto? offset,
  }) => MetaDto(
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    timezone: timezone ?? this.timezone,
    method: method ?? this.method,
    latitudeAdjustmentMethodDto:
        latitudeAdjustmentMethodDto ?? this.latitudeAdjustmentMethodDto,
    midnightMode: midnightMode ?? this.midnightMode,
    school: school ?? this.school,
    offset: offset ?? this.offset,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['timezone'] = timezone;
    if (method != null) {
      map['method'] = method?.toJson();
    }
    map['latitudeAdjustmentMethodDto'] = latitudeAdjustmentMethodDto;
    map['midnightMode'] = midnightMode;
    map['school'] = school;
    if (offset != null) {
      map['offset'] = offset?.toJson();
    }
    return map;
  }
}
