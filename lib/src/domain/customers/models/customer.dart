import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final int id;
  final String name;
  final int age;
  final String email;
  final String address;
  final String city;
  final String state;

  const Customer({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.address,
    required this.city,
    required this.state,
  });

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'] as int? ?? 0,
      name: map['name'] as String? ?? '',
      age: map['age'] as int? ?? 0,
      email: map['email'] as String? ?? '',
      address: map['address'] as String? ?? '',
      city: map['city'] as String? ?? '',
      state: map['state'] as String? ?? '',
    );
  }

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] as int? ?? 0,
      name: json['nome'] as String? ?? '',
      age: json['idade'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      address: json['endereco'] as String? ?? '',
      city: json['cidade'] as String? ?? '',
      state: json['estado'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'email': email,
      'address': address,
      'city': city,
      'state': state,
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      age,
      email,
      address,
      city,
      state,
    ];
  }
}
