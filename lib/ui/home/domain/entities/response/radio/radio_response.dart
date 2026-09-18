import 'package:islami/ui/home/domain/entities/response/radio/radio.dart';

class RadioResponse {
  RadioResponse({this.radios});

  List<Radio>? radios;

  RadioResponse copyWith({List<Radio>? radios}) =>
      RadioResponse(radios: radios ?? this.radios);
}
