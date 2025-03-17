import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/use_cases/customers_sync_use_case.dart';
import 'package:mob4pay_tech_challenge/src/ui/splash/viewmodels/splash_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/customers/fixtures/customers_fixtures.dart';
@GenerateNiceMocks([MockSpec<CustomersSyncUseCase>()])
import 'splash_viewmodel_test.mocks.dart';

void main() {
  late final MockCustomersSyncUseCase customersSyncUseCaseMock;
  late final SplashViewmodel splashViewmodel;

  setUpAll(() {
    customersSyncUseCaseMock = MockCustomersSyncUseCase();
    splashViewmodel = SplashViewmodel(
      customersSyncUseCase: customersSyncUseCaseMock,
    );
  });

  group('SplashViewmodel -', () {
    group('initApp:', () {
      test(
        'Deve alterar o estado da variável que indica que a página foi carrega '
        'para true quando não ocorrer nenhuma falha ao sincronizar os clientes',
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
          await splashViewmodel.initApp();

          // VERIFICAÇÃO
          expect(splashViewmodel.isLoading, isFalse);
          expect(splashViewmodel.hasError, isFalse);
        },
      );

      test(
        'Deve indicar que o carregamento finalizou quando ocorrer uma falha ao '
        'sincronizar e buscar localmente os clientes',
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
          await splashViewmodel.initApp();

          // VERIFICAÇÃO
          expect(splashViewmodel.isLoading, isFalse);
          expect(splashViewmodel.hasError, isTrue);
        },
      );
    });
  });
}
