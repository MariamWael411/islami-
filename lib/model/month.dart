class Month {
  Month({this.number, this.en});

  Month.fromJson(dynamic json) {
    number = json['number'];
    en = json['en'];
  }

  num? number;
  String? en;

  Month copyWith({num? number, String? en}) =>
      Month(number: number ?? this.number, en: en ?? this.en);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['en'] = en;
    return map;
  }
}
