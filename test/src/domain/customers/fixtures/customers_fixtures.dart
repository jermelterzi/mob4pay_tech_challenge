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

  static const tMaps = [
    {
      'id': 1,
      'name': 'João da Silva Barbosa',
      'age': 30,
      'email': 'jsilva@email.com',
      'address': 'Rua Serra da Japi',
      'city': 'São Paulo',
      'state': 'SP'
    },
    {
      'id': 2,
      'name': 'Raquel Pereira Motta',
      'age': 26,
      'email': 'raquel@email.com',
      'address': 'Rua Julio Colaço',
      'city': 'São Paulo',
      'state': 'SP'
    },
    {
      'id': 3,
      'name': 'Thiago Eduardo Maranhão',
      'age': 55,
      'email': 'thiaguinho@email.com',
      'address': 'Rua Tuiuti',
      'city': 'São Paulo',
      'state': 'SP'
    }
  ];

  static const tModel = Customer(
    id: 1,
    name: 'João da Silva Barbosa',
    age: 30,
    email: 'jsilva@email.com',
    address: 'Rua Serra da Japi',
    city: 'São Paulo',
    state: 'SP',
  );

  static const tModels = [
    Customer(
      id: 1,
      name: 'João da Silva Barbosa',
      age: 30,
      email: 'jsilva@email.com',
      address: 'Rua Serra da Japi',
      city: 'São Paulo',
      state: 'SP',
    ),
    Customer(
      id: 2,
      name: 'Raquel Pereira Motta',
      age: 26,
      email: 'raquel@email.com',
      address: 'Rua Julio Colaço',
      city: 'São Paulo',
      state: 'SP',
    ),
    Customer(
      id: 3,
      name: 'Thiago Eduardo Maranhão',
      age: 55,
      email: 'thiaguinho@email.com',
      address: 'Rua Tuiuti',
      city: 'São Paulo',
      state: 'SP',
    ),
  ];

  static const tRemoteMap = {
    'id': 1,
    'nome': 'João da Silva Barbosa',
    'idade': 30,
    'email': 'jsilva@email.com',
    'endereco': 'Rua Serra da Japi',
    'cidade': 'São Paulo',
    'estado': 'SP'
  };

  static const tRemoteMaps = [
    {
      'id': 1,
      'nome': 'João da Silva Barbosa',
      'idade': 30,
      'email': 'jsilva@email.com',
      'endereco': 'Rua Serra da Japi',
      'cidade': 'São Paulo',
      'estado': 'SP'
    },
    {
      'id': 2,
      'nome': 'Raquel Pereira Motta',
      'idade': 26,
      'email': 'raquel@email.com',
      'endereco': 'Rua Julio Colaço',
      'cidade': 'São Paulo',
      'estado': 'SP'
    },
    {
      'id': 3,
      'nome': 'Thiago Eduardo Maranhão',
      'idade': 55,
      'email': 'thiaguinho@email.com',
      'endereco': 'Rua Tuiuti',
      'cidade': 'São Paulo',
      'estado': 'SP'
    },
  ];
}
