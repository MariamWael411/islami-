import 'gregorian.dart';
import 'hijri.dart';

class Date {
  Date({this.readable, this.timestamp, this.hijri, this.gregorian});

  Date.fromJson(dynamic json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    hijri = json['hijri'] != null ? Hijri.fromJson(json['hijri']) : null;
    gregorian = json['gregorian'] != null
        ? Gregorian.fromJson(json['gregorian'])
        : null;
  }

  String? readable;
  String? timestamp;
  Hijri? hijri;
  Gregorian? gregorian;

  Date copyWith({
    String? readable,
    String? timestamp,
    Hijri? hijri,
    Gregorian? gregorian,
  }) => Date(
    readable: readable ?? this.readable,
    timestamp: timestamp ?? this.timestamp,
    hijri: hijri ?? this.hijri,
    gregorian: gregorian ?? this.gregorian,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['readable'] = readable;
    map['timestamp'] = timestamp;
    if (hijri != null) {
      map['hijri'] = hijri?.toJson();
    }
    if (gregorian != null) {
      map['gregorian'] = gregorian?.toJson();
    }
    return map;
  }
}
