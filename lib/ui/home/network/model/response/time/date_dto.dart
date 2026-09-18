import 'gregorian_dto.dart';
import 'hijri_dto.dart';

class DateDto {
  DateDto({this.readable, this.timestamp, this.hijri, this.gregorian});

  DateDto.fromJson(dynamic json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    hijri = json['hijri'] != null ? HijriDto.fromJson(json['hijri']) : null;
    gregorian = json['gregorian'] != null
        ? GregorianDto.fromJson(json['gregorian'])
        : null;
  }

  String? readable;
  String? timestamp;
  HijriDto? hijri;
  GregorianDto? gregorian;

  DateDto copyWith({
    String? readable,
    String? timestamp,
    HijriDto? hijri,
    GregorianDto? gregorian,
  }) => DateDto(
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
