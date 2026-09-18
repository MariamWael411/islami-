

class AzarModel {
  AzarModel({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.content,
  });

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
}
