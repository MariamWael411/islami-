class ParamsDto {
  ParamsDto({this.fajr, this.isha});

  ParamsDto.fromJson(dynamic json) {
    fajr = json['Fajr'];
    isha = json['Isha'];
  }

  num? fajr;
  num? isha;

  ParamsDto copyWith({num? fajr, num? isha}) =>
      ParamsDto(fajr: fajr ?? this.fajr, isha: isha ?? this.isha);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Fajr'] = fajr;
    map['Isha'] = isha;
    return map;
  }
}
