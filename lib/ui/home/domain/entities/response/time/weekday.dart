class Weekday {
  Weekday({this.en});

  Weekday.fromJson(dynamic json) {
    en = json['en'];
  }

  String? en;

  Weekday copyWith({String? en}) => Weekday(en: en ?? this.en);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = en;
    return map;
  }
}
