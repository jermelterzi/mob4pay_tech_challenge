import 'package:auto_route/auto_route.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/config/router.dart';

void main() {
  late final AppRouter appRouter;

  setUpAll(() {
    appRouter = AppRouter();
  });

  group('AppRouter', () {
    test('routes', () {
      // AÇÃO
      final routes = appRouter.routes;

      // VERIFICAÇÃO
      expect(routes, isNotEmpty);
      expect(routes.first, isA<AutoRoute>());
      expect(routes.first.page, SplashRoute.page);
      expect(routes.first.initial, isTrue);
    });
  });
}
