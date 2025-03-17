import 'package:flutter/material.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/repositories/customers_repository.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';

class CustomersViewmodel extends ChangeNotifier {
  final CustomersRepository _customersRepository;

  CustomersViewmodel({required CustomersRepository customersRepository})
      : _customersRepository = customersRepository;

  List<Customer> customers = [];
  bool isLoading = false;
  bool hasError = false;

  Future<void> getCustomers() async {
    isLoading = true;
    notifyListeners();

    final getSavedCustomers = await _customersRepository.getCustomers();

    return getSavedCustomers.fold(
      (savedCustomers) {
        customers = savedCustomers;
        isLoading = false;
        notifyListeners();

        return;
      },
      (_) {
        hasError = true;
        isLoading = false;
        customers = [];
        notifyListeners();

        return;
      },
    );
  }
}
