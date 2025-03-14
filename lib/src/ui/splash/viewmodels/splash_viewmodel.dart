import 'package:flutter/material.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/repositories/customers_repository.dart';

class SplashViewmodel extends ChangeNotifier {
  final CustomersRepository _customersRepository;

  SplashViewmodel({required CustomersRepository customersRepository})
      : _customersRepository = customersRepository;

  bool isLoading = false;
  bool isLoaded = false;
  bool hasError = false;

  Future<void> initApp() async {
    isLoading = true;

    notifyListeners();

    final syncCustomersResult =
        await _customersRepository.synchronizeCustomers();

    return syncCustomersResult.fold(
      (success) {
        isLoading = false;
        isLoaded = true;

        notifyListeners();
      },
      (_) async {
        hasError = true;

        notifyListeners();

        final getSavedCustomersResult =
            await _customersRepository.getCustomers();

        return getSavedCustomersResult.fold(
          (_) {
            isLoading = false;
            isLoaded = true;

            notifyListeners();

            return;
          },
          (_) {
            hasError = true;
            isLoading = false;
            isLoaded = true;

            notifyListeners();
          },
        );
      },
    );
  }
}
