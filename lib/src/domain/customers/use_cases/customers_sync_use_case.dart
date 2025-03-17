import 'dart:async';

import 'package:mob4pay_tech_challenge/src/data/customers/repositories/customers_repository.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';
import 'package:result_dart/result_dart.dart';

abstract class CustomersSyncUseCase {
  Future<ResultDart<List<Customer>, List<Customer>>> syncCustomers();
}

class CustomersSyncUseCaseImpl implements CustomersSyncUseCase {
  final CustomersRepository _customersRepository;

  CustomersSyncUseCaseImpl({required CustomersRepository customersRepository})
      : _customersRepository = customersRepository;

  @override
  Future<ResultDart<List<Customer>, List<Customer>>> syncCustomers() {
    return _customersRepository
        .synchronizeCustomers()
        .flatMapError(_getSavedCustomers);
  }

  Future<ResultDart<List<Customer>, List<Customer>>> _getSavedCustomers(
    Exception _,
  ) async {
    final getSavedCustomersResult = await _customersRepository.getCustomers();

    return getSavedCustomersResult.fold(
      (savedCustomers) => Failure(savedCustomers),
      (_) => const Failure([]),
    );
  }
}
