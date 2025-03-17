import 'dart:async';

import 'package:mob4pay_tech_challenge/src/data/customers/repositories/customers_repository.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';
import 'package:result_dart/result_dart.dart';

abstract class CustomersSyncUseCase {
  AsyncResult<List<Customer>> syncCustomers();
}

class CustomersSyncUseCaseImpl implements CustomersSyncUseCase {
  final CustomersRepository _customersRepository;

  CustomersSyncUseCaseImpl({required CustomersRepository customersRepository})
      : _customersRepository = customersRepository;

  @override
  AsyncResult<List<Customer>> syncCustomers() {
    return _customersRepository
        .synchronizeCustomers()
        .flatMapError(_getSavedCustomers);
  }

  Future<ResultDart<List<Customer>, Exception>> _getSavedCustomers(
    Exception _,
  ) {
    return _customersRepository.getCustomers();
  }
}
