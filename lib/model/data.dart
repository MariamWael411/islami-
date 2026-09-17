import 'package:islami/model/timings.dart';

import 'date.dart';
import 'meta.dart';

class Data {
  Data({this.timings, this.date, this.meta});

  Data.fromJson(dynamic json) {
    timings = json['timings'] != null
        ? Timings.fromJson(json['timings'])
        : null;
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Timings? timings;
  Date? date;
  Meta? meta;

  Data copyWith({Timings? timings, Date? date, Meta? meta}) => Data(
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
