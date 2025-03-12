class Customer {
  final int id;
  final String name;
  final int age;
  final String email;
  final String address;
  final String city;
  final String state;

  Customer({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.address,
    required this.city,
    required this.state,
  });

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
