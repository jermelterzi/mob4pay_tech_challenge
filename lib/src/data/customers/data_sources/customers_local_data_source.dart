import 'package:mob4pay_tech_challenge/src/data/services/local_storage.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';

abstract class CustomersLocalDataSource {
  Future<void> deleteCustomers();

  Future<List<Customer>> getCustomers();

  Future<void> saveCustomer(Customer customer);
}

class CustomersLocalDataSourceImpl implements CustomersLocalDataSource {
  final LocalStorage _localStorage;

  CustomersLocalDataSourceImpl({required LocalStorage localStorage})
      : _localStorage = localStorage;

  @override
  Future<void> deleteCustomers() {
    return _localStorage.removeAll(table: Tables.customers.name);
  }

  @override
  Future<List<Customer>> getCustomers() async {
    final customersMaps =
        await _localStorage.getAll(table: Tables.customers.name);

    return customersMaps.map((map) => Customer.fromMap(map)).toList();
  }

  @override
  Future<void> saveCustomer(Customer customer) {
    return _localStorage.save(
      table: Tables.customers.name,
      value: customer.toMap(),
    );
  }
}
