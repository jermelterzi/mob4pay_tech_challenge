import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/config/dependencies.dart';
import 'package:mob4pay_tech_challenge/src/ui/splash/pages/splash_page.dart';
import 'package:mob4pay_tech_challenge/src/ui/splash/viewmodels/splash_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<SplashViewmodel>()])
import 'splash_page_test.mocks.dart';

void main() {
  late final MockSplashViewmodel splashViewmodelMock;

  setUpAll(() {
    splashViewmodelMock = MockSplashViewmodel();

    getIt.registerFactory<SplashViewmodel>(() => splashViewmodelMock);
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

        // VERIFICAÇÃO`
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

        // VERIFICAÇÃO`
      },
    );
  });
}
