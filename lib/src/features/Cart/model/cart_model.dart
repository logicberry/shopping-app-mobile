// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../Product/model/product_model.dart';

class CartModel {
  final String id;
  final ProductModel product;
  final int quantity;
  CartModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  CartModel copyWith({
    String? id,
    ProductModel? product,
    int? quantity,
    double? totalPrice,
  }) {
    return CartModel(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] as String,
      product: ProductModel.fromMap(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(id: $id, product: $product, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.product == product &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^ product.hashCode ^ quantity.hashCode;
  }
}
