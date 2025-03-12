import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';

class CustomersFixtures {
  static const tMap = {
    'id': 1,
    'name': 'João da Silva Barbosa',
    'age': 30,
    'email': 'jsilva@email.com',
    'address': 'Rua Serra da Japi',
    'city': 'São Paulo',
    'state': 'SP'
  };

  static const tModel = Customer(
    id: 1,
    name: 'João da Silva Barbosa',
    age: 30,
    email: 'jsilva@email.com',
    address: 'Rua Serra da Japi',
    city: 'São Paulo',
    state: 'SP',
  );

  static const tRemoteMap = {
    'id': 1,
    'nome': 'João da Silva Barbosa',
    'idade': 30,
    'email': 'jsilva@email.com',
    'endereco': 'Rua Serra da Japi',
    'cidade': 'São Paulo',
    'estado': 'SP'
  };
}
