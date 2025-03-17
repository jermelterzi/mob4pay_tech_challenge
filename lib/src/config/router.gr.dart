// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [CustomerDetailsPage]
class CustomerDetailsRoute extends PageRouteInfo<CustomerDetailsRouteArgs> {
  CustomerDetailsRoute({
    required Customer customer,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         CustomerDetailsRoute.name,
         args: CustomerDetailsRouteArgs(customer: customer, key: key),
         initialChildren: children,
       );

  static const String name = 'CustomerDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CustomerDetailsRouteArgs>();
      return CustomerDetailsPage(customer: args.customer, key: args.key);
    },
  );
}

class CustomerDetailsRouteArgs {
  const CustomerDetailsRouteArgs({required this.customer, this.key});

  final Customer customer;

  final Key? key;

  @override
  String toString() {
    return 'CustomerDetailsRouteArgs{customer: $customer, key: $key}';
  }
}

/// generated route for
/// [CustomersPage]
class CustomersRoute extends PageRouteInfo<void> {
  const CustomersRoute({List<PageRouteInfo>? children})
    : super(CustomersRoute.name, initialChildren: children);

  static const String name = 'CustomersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CustomersPage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}
