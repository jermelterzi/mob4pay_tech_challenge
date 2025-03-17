import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/config/dependencies.dart';
import 'package:mob4pay_tech_challenge/src/config/router.dart';
import 'package:mob4pay_tech_challenge/src/ui/customers/pages/customers_page.dart';
import 'package:mob4pay_tech_challenge/src/ui/customers/viewmodels/customers_viewmodel.dart';
import 'package:mob4pay_tech_challenge/src/ui/services/toast_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/customers/fixtures/customers_fixtures.dart';
@GenerateNiceMocks([MockSpec<CustomersViewmodel>(), MockSpec<ToastService>()])
import 'customers_page_test.mocks.dart';

class MockListener extends Mock {
  void call();
}

void main() {
  late final MockCustomersViewmodel customersViewmodelMock;
  late final MockListener listenerMock;
  late final AppRouter appRouter;
  late final MockToastService toastServiceMock;

  setUpAll(() {
    customersViewmodelMock = MockCustomersViewmodel();
    listenerMock = MockListener();
    appRouter = AppRouter();
    toastServiceMock = MockToastService();

    appRouter.navigationHistory.addListener(listenerMock.call);

    getIt
      ..registerFactory<CustomersViewmodel>(() => customersViewmodelMock)
      ..registerLazySingleton<AppRouter>(() => appRouter)
      ..registerFactory<ToastService>(() => toastServiceMock);
  });

  group('CustomersPage -', () {
    testWidgets(
      'Deve exibir um CircleProgressIndicator quando a tela estiver carregando',
      (tester) async {
        // PREAPAÇÃO
        when(customersViewmodelMock.getCustomers()).thenAnswer((_) async {});

        when(customersViewmodelMock.isLoading).thenReturn(true);

        // AÇÃO
        await tester.pumpWidget(const MaterialApp(home: CustomersPage()));

        // VERIFICAÇÃO
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets(
      'Deve exibir um imagem e uma mensagem quando não forem encontrados nenhum'
      ' cliente salvo',
      (tester) async {
        // PREAPAÇÃO
        when(customersViewmodelMock.getCustomers()).thenAnswer((_) async {
          return;
        });

        when(customersViewmodelMock.isLoading).thenReturn(false);
        when(customersViewmodelMock.customers).thenReturn([]);

        // AÇÃO
        await tester.pumpWidget(const MaterialApp(home: CustomersPage()));

        // VERIFICAÇÃO
        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(find.byType(Image), findsOneWidget);
        expect(
          find.text(
            'Não foi encontrado nenhum cliente salvo, recarregue a página para sincronizar.',
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Deve exibir os cards indicando o nome, estado e id dos clientes quando '
      'existirem clientes salvos',
      (tester) async {
        // PREAPAÇÃO
        when(customersViewmodelMock.getCustomers()).thenAnswer((_) async {
          return;
        });

        when(customersViewmodelMock.isLoading).thenReturn(false);
        when(
          customersViewmodelMock.customers,
        ).thenReturn(
          CustomersFixtures.tModels,
        );

        // AÇÃO
        await tester.pumpWidget(const MaterialApp(home: CustomersPage()));

        // VERIFICAÇÃO
        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(find.byType(Card), findsAtLeast(3));
        expect(find.text('João da Silva Barbosa'), findsOneWidget);
        expect(find.text('Estado: SP'), findsAtLeast(1));
        expect(find.text('1'), findsOneWidget);
      },
    );

    testWidgets(
      'Deve ir para tela de detalhes do cliente quando um dos cards for apertado',
      (tester) async {
        // PREAPAÇÃO
        when(customersViewmodelMock.getCustomers()).thenAnswer((_) async {
          return;
        });

        when(customersViewmodelMock.isLoading).thenReturn(false);
        when(
          customersViewmodelMock.customers,
        ).thenReturn(
          CustomersFixtures.tModels,
        );

        // AÇÃO
        await tester.pumpWidget(const MaterialApp(home: CustomersPage()));
        await tester.tap(find.byKey(const Key('CustomerCard1')));

        // VERIFICAÇÃO
        verify(listenerMock()).called(1);
      },
    );

    testWidgets(
      'Deve exibir um toast quando ocorrer um erro ao buscar os clientes salvos',
      (tester) async {
        // PREAPAÇÃO
        when(customersViewmodelMock.getCustomers()).thenAnswer((_) async {
          return;
        });

        when(customersViewmodelMock.hasError).thenReturn(true);

        // AÇÃO
        await tester.pumpWidget(const MaterialApp(home: CustomersPage()));

        // VERIFICAÇÃO
        verify(
          toastServiceMock.showErrorToast(
            message: 'Houve um erro ao buscar os clientes salvos. Por favor, '
                'sincronize.',
          ),
        ).called(1);
      },
    );
  });
}
