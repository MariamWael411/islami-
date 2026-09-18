class MonthDto {
  MonthDto({this.number, this.en});

  MonthDto.fromJson(dynamic json) {
    number = json['number'];
    en = json['en'];
  }

  num? number;
  String? en;

  MonthDto copyWith({num? number, String? en}) =>
      MonthDto(number: number ?? this.number, en: en ?? this.en);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['en'] = en;
    return map;
  }
}
