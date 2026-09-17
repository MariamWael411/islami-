class Params {
  Params({this.fajr, this.isha});

  Params.fromJson(dynamic json) {
    fajr = json['Fajr'];
    isha = json['Isha'];
  }

  num? fajr;
  num? isha;

  Params copyWith({num? fajr, num? isha}) =>
      Params(fajr: fajr ?? this.fajr, isha: isha ?? this.isha);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Fajr'] = fajr;
    map['Isha'] = isha;
    return map;
  }
}
