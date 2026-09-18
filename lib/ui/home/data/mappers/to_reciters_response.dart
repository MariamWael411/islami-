import 'package:islami/ui/home/domain/entities/response/reciters/moshaf.dart';
import 'package:islami/ui/home/domain/entities/response/reciters/reciters.dart';
import 'package:islami/ui/home/domain/entities/response/reciters/reciters_response.dart';
import 'package:islami/ui/home/network/model/response/reciters/moshaf_dto.dart';
import 'package:islami/ui/home/network/model/response/reciters/reciters_dto.dart';
import 'package:islami/ui/home/network/model/response/reciters/reciters_response_dto.dart';

extension ToRecitersResponse on RecitersResponseDto {
  RecitersResponse toReciterResponse() {
    return RecitersResponse(reciters: reciters?.toRecitersList());
  }
}

extension ToReciter on RecitersDto {
  Reciters toReciters() {
    return Reciters(
      name: name,
      id: id,
      date: date,
      letter: letter,
      moshaf: moshaf?.toMoshafList(),
    );
  }
}

extension ToMoshaf on MoshafDto {
  Moshaf toMoshaf() {
    return Moshaf(
      name: name,
      id: id,
      moshafType: moshafType,
      rewayaId: rewayaId,
      server: server,
      surahList: surahList,
      surahTotal: surahTotal,
    );
  }
}

extension ToMoshafList on List<MoshafDto> {
  List<Moshaf> toMoshafList() {
    return map((e) => e.toMoshaf()).toList();
  }
}

extension ToReciterList on List<RecitersDto> {
  List<Reciters> toRecitersList() {
    return map((e) => e.toReciters()).toList();
  }
}
