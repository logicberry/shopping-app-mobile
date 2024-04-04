// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final double initialPrice;
  final String imageUrl;
  final Category category;
  final String company;
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.initialPrice,
    required this.imageUrl,
    required this.category,
    required this.company,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    double? initialPrice,
    String? imageUrl,
    Category? category,
    String? company,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      initialPrice: initialPrice ?? this.initialPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      company: company ?? this.company,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'initialPrice': initialPrice,
      'imageUrl': imageUrl,
      'category': category.toMap(),
      'company': company,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      initialPrice: map['initialPrice'] as double,
      imageUrl: map['imageUrl'] as String,
      category: Category.fromMap(map['category'] as Map<String, dynamic>),
      company: map['company'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, price: $price, initialPrice: $initialPrice, imageUrl: $imageUrl, category: $category, company: $company)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.initialPrice == initialPrice &&
        other.imageUrl == imageUrl &&
        other.category == category &&
        other.company == company;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        initialPrice.hashCode ^
        imageUrl.hashCode ^
        category.hashCode ^
        company.hashCode;
  }
}

class Category {
  final int id;
  final String name;
  Category({
    required this.id,
    required this.name,
  });

  Category copyWith({
    int? id,
    String? name,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Category(id: $id, name: $name)';

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
