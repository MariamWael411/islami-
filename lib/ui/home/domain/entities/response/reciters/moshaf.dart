class Moshaf {
  Moshaf({
    this.id,
    this.name,
    this.rewayaId,
    this.server,
    this.surahTotal,
    this.moshafType,
    this.surahList,
  });

  num? id;
  String? name;
  num? rewayaId;
  String? server;
  num? surahTotal;
  num? moshafType;
  String? surahList;

  Moshaf copyWith({
    num? id,
    String? name,
    num? rewayaId,
    String? server,
    num? surahTotal,
    num? moshafType,
    String? surahList,
  }) => Moshaf(
    id: id ?? this.id,
    name: name ?? this.name,
    rewayaId: rewayaId ?? this.rewayaId,
    server: server ?? this.server,
    surahTotal: surahTotal ?? this.surahTotal,
    moshafType: moshafType ?? this.moshafType,
    surahList: surahList ?? this.surahList,
  );
}
