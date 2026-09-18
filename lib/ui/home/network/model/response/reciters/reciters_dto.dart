import 'moshaf_dto.dart';

class RecitersDto {
  RecitersDto({this.id, this.name, this.letter, this.date, this.moshaf});

  RecitersDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    letter = json['letter'];
    date = json['date'];
    if (json['moshaf'] != null) {
      moshaf = [];
      json['moshaf'].forEach((v) {
        moshaf?.add(MoshafDto.fromJson(v));
      });
    }
  }

  num? id;
  String? name;
  String? letter;
  String? date;
  List<MoshafDto>? moshaf;

  RecitersDto copyWith({
    num? id,
    String? name,
    String? letter,
    String? date,
    List<MoshafDto>? moshaf,
  }) => RecitersDto(
    id: id ?? this.id,
    name: name ?? this.name,
    letter: letter ?? this.letter,
    date: date ?? this.date,
    moshaf: moshaf ?? this.moshaf,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['letter'] = letter;
    map['date'] = date;
    if (moshaf != null) {
      map['moshaf'] = moshaf?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
