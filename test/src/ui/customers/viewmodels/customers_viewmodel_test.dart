import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/repositories/customers_repository.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/use_cases/customers_sync_use_case.dart';
import 'package:mob4pay_tech_challenge/src/ui/customers/viewmodels/customers_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/customers/fixtures/customers_fixtures.dart';
@GenerateNiceMocks([
  MockSpec<CustomersRepository>(),
  MockSpec<CustomersSyncUseCase>(),
])
import 'customers_viewmodel_test.mocks.dart';

void main() {
  late final MockCustomersRepository customersRepositoryMock;
  late final MockCustomersSyncUseCase customersSyncUseCaseMock;
  late final CustomersViewmodel customersViewmodel;

  setUpAll(() {
    customersRepositoryMock = MockCustomersRepository();
    customersSyncUseCaseMock = MockCustomersSyncUseCase();
    customersViewmodel = CustomersViewmodel(
      customersRepository: customersRepositoryMock,
      customersSyncUseCase: customersSyncUseCaseMock,
    );
  });

  group('CustomersViewmodel -', () {
    group('getCostumers:', () {
      test(
        'Deve retornar a lista de clientes atualizada e encerrar o carregamento'
        ' quando não ocorrer nenhum erro ao buscar os clientes salvos',
        () async {
          // PREPARAÇÃO
          provideDummy<ResultDart<List<Customer>, Exception>>(
            const Success(CustomersFixtures.tModels),
          );

          when(
            customersRepositoryMock.getCustomers(),
          ).thenAnswer(
            (_) async => const Success(CustomersFixtures.tModels),
          );

          // AÇÃO
          await customersViewmodel.getCustomers();

          // VERIFICAÇÃO
          expect(
            customersViewmodel.customers,
            equals(CustomersFixtures.tModels),
          );
          expect(customersViewmodel.isLoading, isFalse);
        },
      );

      test(
        'Deve retornar indicar que existe um erro e encerrar o carregamento '
        'quando ocorrer um erro ao buscar os clientes salvos',
        () async {
          // PREPARAÇÃO
          provideDummy<ResultDart<List<Customer>, Exception>>(
            Failure(Exception()),
          );

          when(
            customersRepositoryMock.getCustomers(),
          ).thenAnswer(
            (_) async => Failure(Exception()),
          );

          // AÇÃO
          await customersViewmodel.getCustomers();

          // VERIFICAÇÃO
          expect(
            customersViewmodel.errorMessage,
            equals(
              'Houve um erro ao buscar os clientes salvos. Por favor, sincronize.',
            ),
          );
          expect(customersViewmodel.isLoading, isFalse);
          expect(customersViewmodel.customers, equals([]));
        },
      );
    });

    group('syncCustomers:', () {
      test(
        'Deve retornar a lista de clientes sincronizada e parar o carregamento '
        'quando não ocorrer um erro ao sincronizar',
        () async {
          // PREPARAÇÃO
          provideDummy<ResultDart<List<Customer>, List<Customer>>>(
            const Success(CustomersFixtures.tModels),
          );

          when(
            customersSyncUseCaseMock.syncCustomers(),
          ).thenAnswer(
            (_) async => const Success(CustomersFixtures.tModels),
          );

          // AÇÃO
          await customersViewmodel.syncCustomers();

          // VERIFICAÇÃO
          expect(customersViewmodel.errorMessage, equals(''));
          expect(customersViewmodel.isLoading, isFalse);
          expect(
            customersViewmodel.customers,
            equals(CustomersFixtures.tModels),
          );
        },
      );

      test(
        'Deve indicar que ocorreu um erro, parar o carregamento e retornar a '
        'lista de clientes que não pode ser sincronizada quando ocorrer um '
        'erro ao sincronizar',
        () async {
          // PREPARAÇÃO
          provideDummy<ResultDart<List<Customer>, List<Customer>>>(
            const Failure([]),
          );

          when(
            customersSyncUseCaseMock.syncCustomers(),
          ).thenAnswer(
            (_) async => const Failure([]),
          );

          // AÇÃO
          await customersViewmodel.syncCustomers();

          // VERIFICAÇÃO
          expect(
            customersViewmodel.errorMessage,
            equals(
              'Houve um erro ao sincronizar os clientes.',
            ),
          );
          expect(customersViewmodel.isLoading, isFalse);
          expect(customersViewmodel.customers, equals(<Customer>[]));
        },
      );
    });
  });
}
