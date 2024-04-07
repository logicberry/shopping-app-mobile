import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
//   {
//     "id": 4,
//     "name": "malik",
//     "email": "malikrasaq@gmail.com",
//     "phone": "09036985938",
//     "address": "",
//     "country": null,
//     "role": "USER"
// }

class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? country;
  final String? role;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.country,
    this.role,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? country,
    String? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      country: country ?? this.country,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'country': country,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, phone: $phone, address: $address, country: $country, role: $role)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.phone == phone &&
      other.address == address &&
      other.country == country &&
      other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      address.hashCode ^
      country.hashCode ^
      role.hashCode;
  }
}
