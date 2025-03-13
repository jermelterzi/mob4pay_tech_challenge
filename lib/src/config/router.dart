import 'package:auto_route/auto_route.dart';
import 'package:mob4pay_tech_challenge/src/ui/splash/splash_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [AutoRoute(page: SplashRoute.page, path: '/')];
}
