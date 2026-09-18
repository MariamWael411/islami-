class RadioDto {
  RadioDto({this.id, this.name, this.url, this.recentDate});

  RadioDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    recentDate = json['recent_date'];
  }

  num? id;
  String? name;
  String? url;
  String? recentDate;

  RadioDto copyWith({num? id, String? name, String? url, String? recentDate}) =>
      RadioDto(
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
        recentDate: recentDate ?? this.recentDate,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    map['recent_date'] = recentDate;
    return map;
  }
}
