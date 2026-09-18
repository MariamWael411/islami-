import 'package:islami/ui/home/network/model/response/time/timings_dto.dart';

import 'date_dto.dart';
import 'meta_dto.dart';

class DataDto {
  DataDto({this.timings, this.date, this.meta});

  DataDto.fromJson(dynamic json) {
    timings = json['timings'] != null
        ? TimingsDto.fromJson(json['timings'])
        : null;
    date = json['date'] != null ? DateDto.fromJson(json['date']) : null;
    meta = json['meta'] != null ? MetaDto.fromJson(json['meta']) : null;
  }

  TimingsDto? timings;
  DateDto? date;
  MetaDto? meta;

  DataDto copyWith({TimingsDto? timings, DateDto? date, MetaDto? meta}) =>
      DataDto(
        timings: timings ?? this.timings,
        date: date ?? this.date,
    meta: meta ?? this.meta,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (timings != null) {
      map['timings'] = timings?.toJson();
    }
    if (date != null) {
      map['date'] = date?.toJson();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    return map;
  }
}
