import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/data_sources/customers_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/customers/fixtures/customers_fixtures.dart';
@GenerateNiceMocks([MockSpec<Dio>()])
import 'customers_remote_data_source_test.mocks.dart';

void main() {
  late final MockDio dioMock;
  late final CustomersRemoteDataSource customersRemoteDataSource;

  setUpAll(() {
    dioMock = MockDio();
    customersRemoteDataSource = CustomersRemoteDataSource(dioMock);
  });

  group('CustomersRemoteDataSource -', () {
    group('fetchCustomers:', () {
      test(
        'Quando não ocorrer nenhum problema durante a chama para a API deve '
        'retornar uma lista de clientes',
        () async {
          // PREPARAÇÃO
          when(dioMock.options).thenReturn(BaseOptions());

          when(
            dioMock.fetch<List<dynamic>>(any),
          ).thenAnswer(
            (_) async => Response(
              data: CustomersFixtures.tRemoteMaps,
              statusCode: 200,
              requestOptions: RequestOptions(path: '/obterClientes/clientes'),
            ),
          );

          // AÇÃO
          final customers = await customersRemoteDataSource.fetchCustomers();

          // VERIFICAÇÃO
          expect(customers, equals(CustomersFixtures.tModels));
        },
      );
    });
  });
}
