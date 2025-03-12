class Customer {
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

  factory Customer.fromRemoteMap(Map<String, dynamic> remoteMap) {
    return Customer(
      id: remoteMap['id'] as int? ?? 0,
      name: remoteMap['nome'] as String? ?? '',
      age: remoteMap['idade'] as int? ?? 0,
      email: remoteMap['email'] as String? ?? '',
      address: remoteMap['endereco'] as String? ?? '',
      city: remoteMap['cidade'] as String? ?? '',
      state: remoteMap['estado'] as String? ?? '',
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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Customer &&
        other.id == id &&
        other.name == name &&
        other.age == age &&
        other.email == email &&
        other.address == address &&
        other.city == city &&
        other.state == state;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        age.hashCode ^
        email.hashCode ^
        address.hashCode ^
        city.hashCode ^
        state.hashCode;
  }
}
