class LocationDto {
  LocationDto({this.latitude, this.longitude});

  LocationDto.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  num? latitude;
  num? longitude;

  LocationDto copyWith({num? latitude, num? longitude}) => LocationDto(
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }
}
