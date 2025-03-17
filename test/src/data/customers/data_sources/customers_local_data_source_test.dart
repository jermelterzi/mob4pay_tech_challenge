import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/data_sources/customers_local_data_source.dart';
import 'package:mob4pay_tech_challenge/src/data/services/local_storage.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/customers/fixtures/customers_fixtures.dart';
@GenerateNiceMocks([MockSpec<LocalStorage>()])
import 'customers_local_data_source_test.mocks.dart';

void main() {
  late final MockLocalStorage localStorageMock;
  late final CustomersLocalDataSource customersLocalDataSource;

  setUpAll(() {
    localStorageMock = MockLocalStorage();
    customersLocalDataSource =
        CustomersLocalDataSourceImpl(localStorage: localStorageMock);
  });

  group('CustomersLocalDataSource -', () {
    group('deleteCustomers:', () {
      test(
        'Deve deletar todos os items salvos relacionados aos clientes quando '
        'este método for chamado',
        () async {
          // PREPARAÇÃO
          when(
            localStorageMock.removeAll(table: anyNamed('table')),
          ).thenAnswer(
            (_) async {},
          );

          // AÇÃO
          await customersLocalDataSource.deleteCustomers();

          // VERIFICAÇÃO
          verify(localStorageMock.removeAll(table: 'customers')).called(1);
        },
      );
    });

    group('getCustomers:', () {
      test(
        'Deve buscar todos os items salvos relacionados aos clientes quando '
        'este método for chamado',
        () async {
          // PREPARAÇÃO
          when(
            localStorageMock.getAll(table: anyNamed('table')),
          ).thenAnswer(
            (_) async => CustomersFixtures.tMaps,
          );

          // AÇÃO
          await customersLocalDataSource.getCustomers();

          // VERIFICAÇÃO
          verify(localStorageMock.getAll(table: 'customers')).called(1);
        },
      );
    });

    group('saveCustomer:', () {
      test(
        'Deve salvar o cliente passado por parâmetro quando o método for '
        'chamado',
        () async {
          // PREPARAÇÃO
          when(
            localStorageMock.save(
              table: anyNamed('table'),
              value: anyNamed('value'),
            ),
          ).thenAnswer(
            (_) async {},
          );

          // AÇÃO
          await customersLocalDataSource.saveCustomer(CustomersFixtures.tModel);

          // VERIFICAÇÃO
          verify(localStorageMock.save(
            table: 'customers',
            value: CustomersFixtures.tMap,
          )).called(1);
        },
      );
    });
  });
}
