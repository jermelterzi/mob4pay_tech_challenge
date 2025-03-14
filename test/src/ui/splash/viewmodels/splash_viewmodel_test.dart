import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/repositories/customers_repository.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';
import 'package:mob4pay_tech_challenge/src/ui/splash/viewmodels/splash_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/customers/fixtures/customers_fixtures.dart';
@GenerateNiceMocks([MockSpec<CustomersRepository>()])
import 'splash_viewmodel_test.mocks.dart';

void main() {
  late final MockCustomersRepository customersRepositoryMock;
  late final SplashViewmodel splashViewmodel;

  setUpAll(() {
    customersRepositoryMock = MockCustomersRepository();
    splashViewmodel = SplashViewmodel(
      customersRepository: customersRepositoryMock,
    );
  });

  group('SplashViewmodel -', () {
    group('initApp:', () {
      test(
        'Deve alterar o estado da variável que indica que a página foi carrega '
        'para true quando não ocorrer nenhuma falha ao sincronizar os clientes',
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
          await splashViewmodel.initApp();

          // VERIFICAÇÃO
          expect(splashViewmodel.isLoaded, isTrue);
          expect(splashViewmodel.isLoading, isFalse);
          expect(splashViewmodel.hasError, isFalse);
        },
      );

      test(
        'Deve buscar os clientes salvos e então retornar o resultado quando '
        'ocorrer uma falha ao sincronizar os clientes',
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
          await splashViewmodel.initApp();

          // VERIFICAÇÃO
          expect(splashViewmodel.isLoaded, isTrue);
          expect(splashViewmodel.isLoading, isFalse);
          expect(splashViewmodel.hasError, isTrue);
        },
      );

      test(
        'Deve indicar que o carregamento finalizou quando ocorrer uma falha ao '
        'sincronizar e buscar localmente os clientes',
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
            (_) async => Failure(Exception()),
          );

          // AÇÃO
          await splashViewmodel.initApp();

          // VERIFICAÇÃO
          expect(splashViewmodel.isLoaded, isTrue);
          expect(splashViewmodel.isLoading, isFalse);
          expect(splashViewmodel.hasError, isTrue);
        },
      );
    });
  });
}
