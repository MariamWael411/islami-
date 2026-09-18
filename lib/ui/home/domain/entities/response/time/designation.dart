class Designation {
  Designation({this.abbreviated, this.expanded});

  Designation.fromJson(dynamic json) {
    abbreviated = json['abbreviated'];
    expanded = json['expanded'];
  }

  String? abbreviated;
  String? expanded;

  Designation copyWith({String? abbreviated, String? expanded}) => Designation(
    abbreviated: abbreviated ?? this.abbreviated,
    expanded: expanded ?? this.expanded,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['abbreviated'] = abbreviated;
    map['expanded'] = expanded;
    return map;
  }
}
