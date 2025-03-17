import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/repositories/customers_repository.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/use_cases/customers_sync_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';

import '../fixtures/customers_fixtures.dart';
import 'customers_sync_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CustomersRepository>()])
void main() {
  late final MockCustomersRepository customersRepositoryMock;
  late final CustomersSyncUseCase customersSyncUseCase;

  setUpAll(() {
    customersRepositoryMock = MockCustomersRepository();
    customersSyncUseCase = CustomersSyncUseCaseImpl(
      customersRepository: customersRepositoryMock,
    );
  });

  group('CustomersSyncUseCase -', () {
    group('syncCustomers:', () {
      test(
        'Deve buscar os clientes salvos e retorná-los através de um Success '
        'quando ocorrer um erro ao buscar os clientes no servidor',
        () async {
          // PREPARAÇÃO
          provideDummy<ResultDart<List<Customer>, Exception>>(
            const Success(CustomersFixtures.tModels),
          );

          when(
            customersRepositoryMock.synchronizeCustomers(),
          ).thenAnswer(
            (_) async => Failure(
              DioException(requestOptions: RequestOptions()),
            ),
          );

          when(
            customersRepositoryMock.getCustomers(),
          ).thenAnswer(
            (_) async => const Success(CustomersFixtures.tModels),
          );

          // AÇÃO
          final syncCustomersResult =
              await customersSyncUseCase.syncCustomers();

          // VERIFICAÇÃO
          expect(syncCustomersResult, const Success(CustomersFixtures.tModels));
          verify(customersRepositoryMock.getCustomers()).called(1);
        },
      );

      test(
        'Deve retornar a lista de clientes do servidor através de um Success '
        'quando não ocorrer nenhum erro',
        () async {
          // PREPARAÇÃO
          provideDummy<ResultDart<List<Customer>, Exception>>(
            const Success(CustomersFixtures.tModels),
          );

          when(
            customersRepositoryMock.synchronizeCustomers(),
          ).thenAnswer(
            (_) async => const Success(CustomersFixtures.tModels),
          );

          // AÇÃO
          final syncCustomersResult =
              await customersSyncUseCase.syncCustomers();

          // VERIFICAÇÃO
          expect(syncCustomersResult, const Success(CustomersFixtures.tModels));
          verifyNever(customersRepositoryMock.getCustomers());
        },
      );
    });
  });
}
