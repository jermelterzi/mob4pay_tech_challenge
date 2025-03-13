import 'package:dio/dio.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/data_sources/customers_local_data_source.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/data_sources/customers_remote_data_source.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';
import 'package:result_dart/result_dart.dart';

abstract class CustomersRepository {
  AsyncResult<List<Customer>> getCustomers();

  AsyncResult<List<Customer>> synchronizeCustomers();
}

class CustomersRepositoryImpl implements CustomersRepository {
  final CustomersRemoteDataSource _remoteDataSource;
  final CustomersLocalDataSource _localDataSource;

  CustomersRepositoryImpl(
      {required CustomersRemoteDataSource remoteDataSource,
      required CustomersLocalDataSource localDataSource})
      : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  AsyncResult<List<Customer>> getCustomers() async {
    final savedCustomers = await _localDataSource.getCustomers();

    return Success(savedCustomers);
  }

  @override
  AsyncResult<List<Customer>> synchronizeCustomers() async {
    late final List<Customer> remoteCustomers;

    try {
      remoteCustomers = await _remoteDataSource.fetchCustomers();
    } on DioException catch (e) {
      return Failure(DioException(requestOptions: e.requestOptions));
    }

    final savedCustomers = await _localDataSource.getCustomers();

    if (savedCustomers.isEmpty) {
      for (final customer in remoteCustomers) {
        await _localDataSource.saveCustomer(customer);
      }

      return Success(remoteCustomers);
    }

    await _localDataSource.deleteCustomers();

    for (final customer in remoteCustomers) {
      await _localDataSource.saveCustomer(customer);
    }

    return Success(remoteCustomers);
  }
}
