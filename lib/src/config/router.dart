import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';
import 'package:mob4pay_tech_challenge/src/ui/customers/pages/customer_details_page.dart';
import 'package:mob4pay_tech_challenge/src/ui/customers/pages/customers_page.dart';
import 'package:mob4pay_tech_challenge/src/ui/splash/pages/splash_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: CustomersRoute.page),
        AutoRoute(page: CustomerDetailsRoute.page)
      ];
}
