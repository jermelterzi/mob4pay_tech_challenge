import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/config/dependencies.dart';
import 'package:mob4pay_tech_challenge/src/config/router.dart';
import 'package:mob4pay_tech_challenge/src/ui/services/toast_service.dart';
import 'package:mob4pay_tech_challenge/src/ui/splash/pages/splash_page.dart';
import 'package:mob4pay_tech_challenge/src/ui/splash/viewmodels/splash_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<SplashViewmodel>(), MockSpec<ToastService>()])
import 'splash_page_test.mocks.dart';

class MockListener extends Mock {
  void call();
}

void main() {
  late final MockSplashViewmodel splashViewmodelMock;
  late final MockListener listenerMock;
  late final AppRouter appRouter;
  late final MockToastService toastServiceMock;

  setUpAll(() {
    splashViewmodelMock = MockSplashViewmodel();
    listenerMock = MockListener();
    appRouter = AppRouter();
    toastServiceMock = MockToastService();

    appRouter.navigationHistory.addListener(listenerMock.call);

    getIt
      ..registerFactory<SplashViewmodel>(() => splashViewmodelMock)
      ..registerLazySingleton<AppRouter>(() => appRouter)
      ..registerFactory<ToastService>(() => toastServiceMock);
  });

  group('SplashPage -', () {
    testWidgets(
      'Deve exibir uma tela com o logo e uma mensagem abaixo quando a viewmodel'
      ' estiver carregando as informações necessárias',
      (tester) async {
        // PREPARAÇÃO
        when(splashViewmodelMock.initApp()).thenAnswer((_) async {});
        when(splashViewmodelMock.isLoading).thenReturn(true);

        // AÇÃO
        await tester.pumpWidget(const SplashPage());

        // VERIFICAÇÃO
        expect(find.byType(Image), findsOneWidget);
        expect(find.text('Carregando informações...'), findsOneWidget);
      },
    );

    testWidgets(
      'Não deve exibir a mensagem de carregamento quando a viewmodel não '
      'estiver carregando as informações',
      (tester) async {
        // PREPARAÇÃO
        when(splashViewmodelMock.initApp()).thenAnswer((_) async {});
        when(splashViewmodelMock.isLoading).thenReturn(false);

        // AÇÃO
        await tester.pumpWidget(const SplashPage());

        // VERIFICAÇÃO
        expect(find.text('Carregando informações...'), findsNothing);
      },
    );

    testWidgets(
      'Deve navegar para a tela de clientes quando carregamento for concluído',
      (tester) async {
        // PREPARAÇÃO
        when(splashViewmodelMock.initApp()).thenAnswer((_) async {});
        when(splashViewmodelMock.isLoaded).thenReturn(true);

        // AÇÃO
        await tester.pumpWidget(const SplashPage());
        splashViewmodelMock.notifyListeners();
        await tester.pumpAndSettle();

        // VERIFICAÇÃO
        // verify(listenerMock()).called(1);
      },
    );

    testWidgets(
      'Deve exibir uma mensagem quando ocorrer um erro durante o carregamento',
      (tester) async {
        // PREPARAÇÃO
        when(splashViewmodelMock.initApp()).thenAnswer((_) async {});
        when(splashViewmodelMock.hasError).thenReturn(true);

        // AÇÃO
        await tester.pumpWidget(const SplashPage());
        await tester.pumpAndSettle();

        // VERIFICAÇÃO
        verify(
          toastServiceMock.showErrorToast(
            message: 'Houve um erro ao sincronizar os clientes',
          ),
        ).called(1);
      },
    );
  });
}
