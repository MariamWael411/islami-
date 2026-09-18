import 'package:islami/ui/home/domain/entities/response/time/weekday.dart';

import 'designation.dart';
import 'month.dart';

class Gregorian {
  Gregorian({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.lunarSighting,
  });

  Gregorian.fromJson(dynamic json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday = json['weekday'] != null
        ? Weekday.fromJson(json['weekday'])
        : null;
    month = json['month'] != null ? Month.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null
        ? Designation.fromJson(json['designation'])
        : null;
    lunarSighting = json['lunarSighting'];
  }

  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;
  bool? lunarSighting;

  Gregorian copyWith({
    String? date,
    String? format,
    String? day,
    Weekday? weekday,
    Month? month,
    String? year,
    Designation? designation,
    bool? lunarSighting,
  }) => Gregorian(
    date: date ?? this.date,
    format: format ?? this.format,
    day: day ?? this.day,
    weekday: weekday ?? this.weekday,
    month: month ?? this.month,
    year: year ?? this.year,
    designation: designation ?? this.designation,
    lunarSighting: lunarSighting ?? this.lunarSighting,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['format'] = format;
    map['day'] = day;
    if (weekday != null) {
      map['weekday'] = weekday?.toJson();
    }
    if (month != null) {
      map['month'] = month?.toJson();
    }
    map['year'] = year;
    if (designation != null) {
      map['designation'] = designation?.toJson();
    }
    map['lunarSighting'] = lunarSighting;
    return map;
  }
}
