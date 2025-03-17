import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/config/dependencies.dart';
import 'package:mob4pay_tech_challenge/src/config/router.dart';
import 'package:mob4pay_tech_challenge/src/ui/customers/pages/customer_details_page.dart';
import 'package:mob4pay_tech_challenge/src/ui/customers/viewmodels/customers_viewmodel.dart';
import 'package:mob4pay_tech_challenge/src/ui/services/toast_service.dart';
import 'package:mob4pay_tech_challenge/src/ui/splash/viewmodels/splash_viewmodel.dart';
import 'package:mockito/annotations.dart';

import '../../../domain/customers/fixtures/customers_fixtures.dart';
import 'customer_details_page_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SplashViewmodel>(),
  MockSpec<CustomersViewmodel>(),
  MockSpec<ToastService>()
])
void main() {
  late final MockSplashViewmodel splashViewmodelMock;
  late final MockCustomersViewmodel customersViewmodelMock;
  late final AppRouter router;
  late final MockToastService toastServiceMock;

  setUpAll(() {
    router = AppRouter();
    splashViewmodelMock = MockSplashViewmodel();
    customersViewmodelMock = MockCustomersViewmodel();
    toastServiceMock = MockToastService();

    getIt
      ..registerLazySingleton<AppRouter>(() => router)
      ..registerFactory<SplashViewmodel>(() => splashViewmodelMock)
      ..registerFactory<CustomersViewmodel>(() => customersViewmodelMock)
      ..registerFactory<ToastService>(() => toastServiceMock);
  });

  group('CustomerDetailsPage -', () {
    testWidgets(
      'Deve exibir corretamente os detalhes do cliente passado quando esta página for exibida',
      (tester) async {
        // AÇÃO
        await tester.pumpWidget(
          const MaterialApp(
            home: CustomerDetailsPage(customer: CustomersFixtures.tModel),
          ),
        );

        // VERIFICAÇÃO
        expect(find.text('Nome'), findsOneWidget);
        expect(find.text(CustomersFixtures.tModel.name), findsOneWidget);
        expect(find.text('E-mail'), findsOneWidget);
        expect(find.text(CustomersFixtures.tModel.email), findsOneWidget);
        expect(find.text('Endereço'), findsOneWidget);
        expect(find.text(CustomersFixtures.tModel.address), findsOneWidget);
        expect(find.text('Cidade'), findsOneWidget);
        expect(find.text(CustomersFixtures.tModel.city), findsOneWidget);
        expect(find.text('Estado'), findsOneWidget);
        expect(find.text(CustomersFixtures.tModel.state), findsOneWidget);
      },
    );

    testWidgets(
      'Deve retornar para a tela de listagem de clientes quando o ícone na AppBar for apertado',
      (tester) async {
        // AÇÃO
        await tester
            .pumpWidget(
              MaterialApp.router(
                routeInformationParser: router.defaultRouteParser(),
                routerDelegate: router.delegate(),
              ),
            )
            .then((_) => tester.pumpAndSettle());
        router.push(const CustomersRoute());
        await tester.pumpAndSettle();
        router.push(CustomerDetailsRoute(customer: CustomersFixtures.tModel));
        await tester.pumpAndSettle();
        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        // VERIFICAÇÃO
        expect(router.current.name, CustomersRoute.name);
        expect(find.text('Clientes'), findsOne);
      },
    );
  });
}
