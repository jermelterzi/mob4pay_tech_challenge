// Mocks generated by Mockito 5.4.5 from annotations
// in mob4pay_tech_challenge/test/src/ui/customers/pages/customer_details_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:ui' as _i4;

import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart'
    as _i6;
import 'package:mob4pay_tech_challenge/src/ui/customers/viewmodels/customers_viewmodel.dart'
    as _i5;
import 'package:mob4pay_tech_challenge/src/ui/services/toast_service.dart'
    as _i7;
import 'package:mob4pay_tech_challenge/src/ui/splash/viewmodels/splash_viewmodel.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [SplashViewmodel].
///
/// See the documentation for Mockito's code generation for more information.
class MockSplashViewmodel extends _i1.Mock implements _i2.SplashViewmodel {
  @override
  bool get isLoading =>
      (super.noSuchMethod(
            Invocation.getter(#isLoading),
            returnValue: false,
            returnValueForMissingStub: false,
          )
          as bool);

  @override
  set isLoading(bool? _isLoading) => super.noSuchMethod(
    Invocation.setter(#isLoading, _isLoading),
    returnValueForMissingStub: null,
  );

  @override
  bool get hasError =>
      (super.noSuchMethod(
            Invocation.getter(#hasError),
            returnValue: false,
            returnValueForMissingStub: false,
          )
          as bool);

  @override
  set hasError(bool? _hasError) => super.noSuchMethod(
    Invocation.setter(#hasError, _hasError),
    returnValueForMissingStub: null,
  );

  @override
  bool get hasListeners =>
      (super.noSuchMethod(
            Invocation.getter(#hasListeners),
            returnValue: false,
            returnValueForMissingStub: false,
          )
          as bool);

  @override
  _i3.Future<void> initApp() =>
      (super.noSuchMethod(
            Invocation.method(#initApp, []),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  void addListener(_i4.VoidCallback? listener) => super.noSuchMethod(
    Invocation.method(#addListener, [listener]),
    returnValueForMissingStub: null,
  );

  @override
  void removeListener(_i4.VoidCallback? listener) => super.noSuchMethod(
    Invocation.method(#removeListener, [listener]),
    returnValueForMissingStub: null,
  );

  @override
  void dispose() => super.noSuchMethod(
    Invocation.method(#dispose, []),
    returnValueForMissingStub: null,
  );

  @override
  void notifyListeners() => super.noSuchMethod(
    Invocation.method(#notifyListeners, []),
    returnValueForMissingStub: null,
  );
}

/// A class which mocks [CustomersViewmodel].
///
/// See the documentation for Mockito's code generation for more information.
class MockCustomersViewmodel extends _i1.Mock
    implements _i5.CustomersViewmodel {
  @override
  List<_i6.Customer> get customers =>
      (super.noSuchMethod(
            Invocation.getter(#customers),
            returnValue: <_i6.Customer>[],
            returnValueForMissingStub: <_i6.Customer>[],
          )
          as List<_i6.Customer>);

  @override
  set customers(List<_i6.Customer>? _customers) => super.noSuchMethod(
    Invocation.setter(#customers, _customers),
    returnValueForMissingStub: null,
  );

  @override
  bool get isLoading =>
      (super.noSuchMethod(
            Invocation.getter(#isLoading),
            returnValue: false,
            returnValueForMissingStub: false,
          )
          as bool);

  @override
  set isLoading(bool? _isLoading) => super.noSuchMethod(
    Invocation.setter(#isLoading, _isLoading),
    returnValueForMissingStub: null,
  );

  @override
  bool get hasError =>
      (super.noSuchMethod(
            Invocation.getter(#hasError),
            returnValue: false,
            returnValueForMissingStub: false,
          )
          as bool);

  @override
  set hasError(bool? _hasError) => super.noSuchMethod(
    Invocation.setter(#hasError, _hasError),
    returnValueForMissingStub: null,
  );

  @override
  bool get hasListeners =>
      (super.noSuchMethod(
            Invocation.getter(#hasListeners),
            returnValue: false,
            returnValueForMissingStub: false,
          )
          as bool);

  @override
  _i3.Future<void> getCustomers() =>
      (super.noSuchMethod(
            Invocation.method(#getCustomers, []),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  void addListener(_i4.VoidCallback? listener) => super.noSuchMethod(
    Invocation.method(#addListener, [listener]),
    returnValueForMissingStub: null,
  );

  @override
  void removeListener(_i4.VoidCallback? listener) => super.noSuchMethod(
    Invocation.method(#removeListener, [listener]),
    returnValueForMissingStub: null,
  );

  @override
  void dispose() => super.noSuchMethod(
    Invocation.method(#dispose, []),
    returnValueForMissingStub: null,
  );

  @override
  void notifyListeners() => super.noSuchMethod(
    Invocation.method(#notifyListeners, []),
    returnValueForMissingStub: null,
  );
}

/// A class which mocks [ToastService].
///
/// See the documentation for Mockito's code generation for more information.
class MockToastService extends _i1.Mock implements _i7.ToastService {
  @override
  _i3.Future<void> showErrorToast({String? message}) =>
      (super.noSuchMethod(
            Invocation.method(#showErrorToast, [], {#message: message}),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);
}
