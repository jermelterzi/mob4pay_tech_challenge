import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/data_sources/customers_local_data_source.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/data_sources/customers_remote_data_source.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/repositories/customers_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/customers/fixtures/customers_fixtures.dart';
@GenerateNiceMocks([
  MockSpec<CustomersRemoteDataSource>(),
  MockSpec<CustomersLocalDataSource>(),
])
import 'customers_repository_test.mocks.dart';

void main() {
  late final MockCustomersRemoteDataSource customersRemoteDataSourceMock;
  late final MockCustomersLocalDataSource customersLocalDataSourceMock;
  late final CustomersRepository customersRepository;

  setUpAll(() {
    customersRemoteDataSourceMock = MockCustomersRemoteDataSource();
    customersLocalDataSourceMock = MockCustomersLocalDataSource();
    customersRepository = CustomersRepositoryImpl(
      remoteDataSource: customersRemoteDataSourceMock,
      localDataSource: customersLocalDataSourceMock,
    );
  });

  group('CustomersRepository -', () {
    group('synchronizeCustomers:', () {
      test(
        'Deve retornar um sucesso quando o usuário ainda não possuir nenhum '
        'cliente salvo',
        () async {
          // PREPARAÇÃO
          when(
            customersRemoteDataSourceMock.fetchCustomers(),
          ).thenAnswer(
            (_) async => CustomersFixtures.tModels,
          );

          when(
            customersLocalDataSourceMock.getCustomers(),
          ).thenAnswer(
            (_) async => [],
          );

          when(
            customersLocalDataSourceMock.saveCustomer(any),
          ).thenAnswer(
            (_) async {},
          );

          // AÇÃO
          final syncCustomersResult =
              await customersRepository.synchronizeCustomers();

          // VERIFICAÇÃO
          expect(
            syncCustomersResult,
            equals(const Success(CustomersFixtures.tModels)),
          );
        },
      );

      test(
        'Deve retornar um sucesso quando o usuário já possuir clientes salvos',
        () async {
          // PREPARAÇÃO
          when(
            customersRemoteDataSourceMock.fetchCustomers(),
          ).thenAnswer(
            (_) async => CustomersFixtures.tModels,
          );

          when(
            customersLocalDataSourceMock.getCustomers(),
          ).thenAnswer(
            (_) async => CustomersFixtures.tModels,
          );

          when(
            customersLocalDataSourceMock.deleteCustomers(),
          ).thenAnswer(
            (_) async {},
          );

          when(
            customersLocalDataSourceMock.saveCustomer(any),
          ).thenAnswer(
            (_) async {},
          );

          // AÇÃO
          final syncCustomersResult =
              await customersRepository.synchronizeCustomers();

          // VERIFICAÇÃO
          expect(
            syncCustomersResult,
            equals(const Success(CustomersFixtures.tModels)),
          );
        },
      );
    });
  });
}
