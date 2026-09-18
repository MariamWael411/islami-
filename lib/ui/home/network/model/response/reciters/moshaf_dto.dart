class MoshafDto {
  MoshafDto({
    this.id,
    this.name,
    this.rewayaId,
    this.server,
    this.surahTotal,
    this.moshafType,
    this.surahList,
  });

  MoshafDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    rewayaId = json['rewaya_id'];
    server = json['server'];
    surahTotal = json['surah_total'];
    moshafType = json['moshaf_type'];
    surahList = json['surah_list'];
  }

  num? id;
  String? name;
  num? rewayaId;
  String? server;
  num? surahTotal;
  num? moshafType;
  String? surahList;

  MoshafDto copyWith({
    num? id,
    String? name,
    num? rewayaId,
    String? server,
    num? surahTotal,
    num? moshafType,
    String? surahList,
  }) => MoshafDto(
    id: id ?? this.id,
    name: name ?? this.name,
    rewayaId: rewayaId ?? this.rewayaId,
    server: server ?? this.server,
    surahTotal: surahTotal ?? this.surahTotal,
    moshafType: moshafType ?? this.moshafType,
    surahList: surahList ?? this.surahList,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['rewaya_id'] = rewayaId;
    map['server'] = server;
    map['surah_total'] = surahTotal;
    map['moshaf_type'] = moshafType;
    map['surah_list'] = surahList;
    return map;
  }
}
