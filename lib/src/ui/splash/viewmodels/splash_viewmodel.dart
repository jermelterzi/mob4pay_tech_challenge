import 'package:flutter/material.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/use_cases/customers_sync_use_case.dart';

class SplashViewmodel extends ChangeNotifier {
  final CustomersSyncUseCase _customersSyncUseCase;

  SplashViewmodel({required CustomersSyncUseCase customersSyncUseCase})
      : _customersSyncUseCase = customersSyncUseCase;

  bool isLoading = true;
  bool hasError = false;

  Future<void> initApp() async {
    final syncCustomersResult = await _customersSyncUseCase.syncCustomers();

    return syncCustomersResult.fold(
      (_) {
        isLoading = false;

        notifyListeners();
      },
      (_) {
        isLoading = false;
        hasError = true;

        notifyListeners();
      },
    );
  }
}
