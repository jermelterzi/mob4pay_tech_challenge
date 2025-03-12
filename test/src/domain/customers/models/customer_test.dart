import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';

import '../fixtures/customers_fixtures.dart';

void main() {
  group('Customer -', () {
    test(
      'fromMap',
      () {
        // AÇÃO
        final customer = Customer.fromMap(CustomersFixtures.tMap);

        // VERIFICAÇÃO
        expect(customer, equals(CustomersFixtures.tModel));
      },
    );

    test(
      'fromRemoteMap',
      () {
        // AÇÃO
        final customer = Customer.fromRemoteMap(CustomersFixtures.tRemoteMap);

        // VERIFICAÇÃO
        expect(customer, equals(CustomersFixtures.tModel));
      },
    );

    test(
      'toMap',
      () {
        // AÇÃO
        final map = CustomersFixtures.tModel.toMap();

        // VERIFICAÇÃO
        expect(map, equals(CustomersFixtures.tMap));
      },
    );

    test('Igualdade', () {
      // PREPARAÇÃO
      const tModel = CustomersFixtures.tModel;

      const tEqualModel = Customer(
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
