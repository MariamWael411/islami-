import 'reciters.dart';

class RecitersResponse {
  RecitersResponse({this.reciters});

  List<Reciters>? reciters;

  RecitersResponse copyWith({List<Reciters>? reciters}) =>
      RecitersResponse(reciters: reciters ?? this.reciters);
}
