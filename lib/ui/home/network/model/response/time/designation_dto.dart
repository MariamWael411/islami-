class DesignationDto {
  DesignationDto({this.abbreviated, this.expanded});

  DesignationDto.fromJson(dynamic json) {
    abbreviated = json['abbreviated'];
    expanded = json['expanded'];
  }

  String? abbreviated;
  String? expanded;

  DesignationDto copyWith({String? abbreviated, String? expanded}) =>
      DesignationDto(
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
