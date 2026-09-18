class WeekdayDto {
  WeekdayDto({this.en});

  WeekdayDto.fromJson(dynamic json) {
    en = json['en'];
  }

  String? en;

  WeekdayDto copyWith({String? en}) => WeekdayDto(en: en ?? this.en);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = en;
    return map;
  }
}
