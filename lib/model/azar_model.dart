import 'dart:convert';

import 'package:flutter/services.dart';

class AzarModel {
  AzarModel({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.content,
  });

  AzarModel.fromJson(dynamic json) {
    category = json['category'];
    count = json['count'];
    description = json['description'];
    reference = json['reference'];
    content = json['content'];
  }

  String? category;
  String? count;
  String? description;
  String? reference;
  String? content;

  AzarModel copyWith({
    String? category,
    String? count,
    String? description,
    String? reference,
    String? content,
  }) => AzarModel(
    category: category ?? this.category,
    count: count ?? this.count,
    description: description ?? this.description,
    reference: reference ?? this.reference,
    content: content ?? this.content,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    map['count'] = count;
    map['description'] = description;
    map['reference'] = reference;
    map['content'] = content;
    return map;
  }

  static Future<List<AzarModel>> loadAzkarContent(String azkarType) async {
    var jsonContent = jsonDecode(
      await rootBundle.loadString("assets/azar/azkar.json"),
    );
    List<AzarModel> azkar = (jsonContent[azkarType] as List)
        .map((azkarModel) => AzarModel.fromJson(azkarModel))
        .toList();
    return azkar;
  }
}
