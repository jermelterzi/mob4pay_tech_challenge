import 'package:flutter/material.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/repositories/customers_repository.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/use_cases/customers_sync_use_case.dart';

class CustomersViewmodel extends ChangeNotifier {
  final CustomersRepository _customersRepository;
  final CustomersSyncUseCase _customersSyncUseCase;

  CustomersViewmodel({
    required CustomersRepository customersRepository,
    required CustomersSyncUseCase customersSyncUseCase,
  })  : _customersRepository = customersRepository,
        _customersSyncUseCase = customersSyncUseCase;

  List<Customer> customers = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> getCustomers() async {
    isLoading = true;
    notifyListeners();

    final getSavedCustomersResult = await _customersRepository.getCustomers();

    return getSavedCustomersResult.fold(
      (savedCustomers) {
        customers = savedCustomers;
        isLoading = false;
        return notifyListeners();
      },
      (_) {
        errorMessage =
            'Houve um erro ao buscar os clientes salvos. Por favor, sincronize.';
        isLoading = false;
        customers = [];
        return notifyListeners();
      },
    );
  }

  Future<void> syncCustomers() async {
    isLoading = true;
    notifyListeners();

    final syncCustomersResult = await _customersSyncUseCase.syncCustomers();

    return syncCustomersResult.fold(
      (syncedCustomers) {
        customers = syncedCustomers;
        isLoading = false;
        errorMessage = '';
        return notifyListeners();
      },
      (notSyncedCustomers) {
        customers = notSyncedCustomers;
        errorMessage = 'Houve um erro ao sincronizar os clientes.';
        isLoading = false;
        return notifyListeners();
      },
    );
  }
}
