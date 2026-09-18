class AzarModelDto {
  AzarModelDto({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.content,
  });

  AzarModelDto.fromJson(dynamic json) {
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

  AzarModelDto copyWith({
    String? category,
    String? count,
    String? description,
    String? reference,
    String? content,
  }) => AzarModelDto(
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
}
