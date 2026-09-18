import 'moshaf.dart';

class Reciters {
  Reciters({this.id, this.name, this.letter, this.date, this.moshaf});

  num? id;
  String? name;
  String? letter;
  String? date;
  List<Moshaf>? moshaf;

  Reciters copyWith({
    num? id,
    String? name,
    String? letter,
    String? date,
    List<Moshaf>? moshaf,
  }) => Reciters(
    id: id ?? this.id,
    name: name ?? this.name,
    letter: letter ?? this.letter,
    date: date ?? this.date,
    moshaf: moshaf ?? this.moshaf,
  );
}
