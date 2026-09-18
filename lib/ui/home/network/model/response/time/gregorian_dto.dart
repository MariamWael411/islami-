import 'package:islami/ui/home/network/model/response/time/designation_dto.dart';
import 'package:islami/ui/home/network/model/response/time/month_dto.dart';
import 'package:islami/ui/home/network/model/response/time/weekday_dto.dart';

class GregorianDto {
  GregorianDto({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.lunarSighting,
  });

  GregorianDto.fromJson(dynamic json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday = json['weekday'] != null
        ? WeekdayDto.fromJson(json['weekday'])
        : null;
    month = json['month'] != null ? MonthDto.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null
        ? DesignationDto.fromJson(json['designation'])
        : null;
    lunarSighting = json['lunarSighting'];
  }

  String? date;
  String? format;
  String? day;
  WeekdayDto? weekday;
  MonthDto? month;
  String? year;
  DesignationDto? designation;
  bool? lunarSighting;

  GregorianDto copyWith({
    String? date,
    String? format,
    String? day,
    WeekdayDto? weekday,
    MonthDto? month,
    String? year,
    DesignationDto? designation,
    bool? lunarSighting,
  }) => GregorianDto(
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
