class Radio {
  Radio({this.id, this.name, this.url, this.recentDate});

  num? id;
  String? name;
  String? url;
  String? recentDate;

  Radio copyWith({num? id, String? name, String? url, String? recentDate}) =>
      Radio(
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
        recentDate: recentDate ?? this.recentDate,
      );
}
