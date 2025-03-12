import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';

void main() {
  group('Customer -', () {
    test('Igualdade', () {
      // PREPARAÇÃO
      final tModel = Customer(
        id: 1,
        name: 'João da Silva Barbosa',
        age: 30,
        email: 'jsilva@email.com',
        address: 'Rua Serra da Japi',
        city: 'São Paulo',
        state: 'SP',
      );

      final tEqualModel = Customer(
        id: 1,
        name: 'João da Silva Barbosa',
        age: 30,
        email: 'jsilva@email.com',
        address: 'Rua Serra da Japi',
        city: 'São Paulo',
        state: 'SP',
      );

      // AÇÃO
      final isEqual = tModel == tEqualModel;

      // VERIFICAÇÃO
      expect(isEqual, isTrue);
    });
  });
}
