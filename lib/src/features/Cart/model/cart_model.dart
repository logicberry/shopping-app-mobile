// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../Product/model/product_model.dart';

class CartModel {
  final String? id;
  final ProductModel? product;
  int? quantity;
  CartModel({
    this.id,
    this.product,
    this.quantity,
  });

  CartModel copyWith({
    String? id,
    ProductModel? product,
    int? quantity,
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
      'product': product?.toMap(),
      'quantity': quantity,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] != null ? map['id'] as String : null,
      product: map['product'] != null ? ProductModel.fromMap(map['product'] as Map<String,dynamic>) : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CartModel(id: $id, product: $product, quantity: $quantity)';

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return
      other.id == id &&
      other.product == product &&
      other.quantity == quantity;
  }

  @override
  int get hashCode => id.hashCode ^ product.hashCode ^ quantity.hashCode;
}
