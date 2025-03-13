import 'package:dio/dio.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';
import 'package:retrofit/retrofit.dart';

part 'customers_remote_data_source.g.dart';

@RestApi(baseUrl: 'https://middleware-mob4pay-homolog.mob4pay.com/teste/')
abstract class CustomersRemoteDataSource {
  factory CustomersRemoteDataSource(Dio dio) = _CustomersRemoteDataSource;

  @GET('/obterClientes')
  Future<List<Customer>> fetchCustomers();
}
