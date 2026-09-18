import 'package:islami/ui/home/domain/entities/response/time/data.dart'
    show Data;
import 'package:islami/ui/home/domain/entities/response/time/date.dart';
import 'package:islami/ui/home/domain/entities/response/time/designation.dart';
import 'package:islami/ui/home/domain/entities/response/time/gregorian.dart';
import 'package:islami/ui/home/domain/entities/response/time/hijri.dart';
import 'package:islami/ui/home/domain/entities/response/time/location.dart';
import 'package:islami/ui/home/domain/entities/response/time/meta.dart';
import 'package:islami/ui/home/domain/entities/response/time/method.dart';
import 'package:islami/ui/home/domain/entities/response/time/month.dart';
import 'package:islami/ui/home/domain/entities/response/time/offest.dart';
import 'package:islami/ui/home/domain/entities/response/time/params.dart';
import 'package:islami/ui/home/domain/entities/response/time/time_response.dart';
import 'package:islami/ui/home/domain/entities/response/time/timings.dart';
import 'package:islami/ui/home/network/model/response/time/data_dto.dart';
import 'package:islami/ui/home/network/model/response/time/date_dto.dart';
import 'package:islami/ui/home/network/model/response/time/designation_dto.dart';
import 'package:islami/ui/home/network/model/response/time/gregorian_dto.dart';
import 'package:islami/ui/home/network/model/response/time/hijri_dto.dart';
import 'package:islami/ui/home/network/model/response/time/location_dto.dart';
import 'package:islami/ui/home/network/model/response/time/meta_dto.dart';
import 'package:islami/ui/home/network/model/response/time/method_dto.dart';
import 'package:islami/ui/home/network/model/response/time/month_dto.dart';
import 'package:islami/ui/home/network/model/response/time/offest_dto.dart';
import 'package:islami/ui/home/network/model/response/time/params_dto.dart';
import 'package:islami/ui/home/network/model/response/time/time_response_dto.dart';
import 'package:islami/ui/home/network/model/response/time/timings_dto.dart';
import 'package:islami/ui/home/network/model/response/time/weekday_dto.dart';

import '../../domain/entities/response/time/weekday.dart';

extension ToTimeResponse on TimeResponseDto {
  TimeResponse toTimeResponse() {
    return TimeResponse(data: data?.toData(), code: code, status: status);
  }
}

extension ToData on DataDto {
  Data toData() {
    return Data(
      date: date?.toDate(),
      meta: meta?.toMeta(),
      timings: timings?.toTimings(),
    );
  }
}

extension ToDate on DateDto {
  Date toDate() {
    return Date(
      gregorian: gregorian?.toGregorian(),
      hijri: hijri?.toHijri(),
      readable: readable,
      timestamp: timestamp,
    );
  }
}

extension ToHijri on HijriDto {
  Hijri toHijri() {
    return Hijri(
      date: date,
      day: day,
      designation: designation?.toDesignation(),
      format: format,
      month: month?.toMonth(),
      weekday: weekday?.toWeekly(),
      year: year,
      method: method,
      adjustedHolidays: adjustedHolidays,
      holidays: holidays,
    );
  }
}

extension ToGregorian on GregorianDto {
  Gregorian toGregorian() {
    return Gregorian(
      date: date,
      day: day,
      designation: designation?.toDesignation(),
      format: format,
      lunarSighting: lunarSighting,
      month: month?.toMonth(),
      weekday: weekday?.toWeekly(),
      year: year,
    );
  }
}

extension ToDesignation on DesignationDto {
  Designation toDesignation() {
    return Designation(abbreviated: abbreviated, expanded: expanded);
  }
}

extension ToWeek on WeekdayDto {
  Weekday toWeekly() {
    return Weekday(en: en);
  }
}

extension ToMonth on MonthDto {
  Month toMonth() {
    return Month(en: en, number: number);
  }
}

extension ToMeta on MetaDto {
  Meta toMeta() {
    return Meta(
      latitude: latitude,
      latitudeAdjustmentMethod: latitudeAdjustmentMethodDto,
      longitude: longitude,
      method: method?.toMethod(),
      midnightMode: midnightMode,
      offset: offset?.toOffest(),
      school: school,
      timezone: timezone,
    );
  }
}

extension ToOffest on OffsetDto {
  Offset toOffest() {
    return Offset(
      sunset: sunset,
      sunrise: sunrise,
      midnight: midnight,
      maghrib: maghrib,
      isha: isha,
      imsak: imsak,
      fajr: fajr,
      dhuhr: dhuhr,
      asr: asr,
    );
  }
}

extension ToMethod on MethodDto {
  Method toMethod() {
    return Method(
      id: id,
      name: name,
      location: location?.toLocation(),
      params: params?.toParams(),
    );
  }
}

extension ToLocation on LocationDto {
  Location toLocation() {
    return Location(longitude: longitude, latitude: latitude);
  }
}

extension ToParams on ParamsDto {
  Params toParams() {
    return Params(fajr: fajr, isha: isha);
  }
}

extension toTiming on TimingsDto {
  Timings toTimings() {
    return Timings(
      asr: asr,
      dhuhr: dhuhr,
      fajr: fajr,
      firstthird: firstthird,
      imsak: imsak,
      isha: isha,
      lastthird: lastthird,
      maghrib: maghrib,
      midnight: midnight,
      sunrise: sunrise,
      sunset: sunset,
    );
  }
}
