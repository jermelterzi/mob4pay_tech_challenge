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
        'Quando ... deve ...',
        () async {
          // PREPARAÇÃO
          final response = [];

          when(
            dioMock.fetch<List<dynamic>>(any),
          ).thenAnswer(
            (_) async => Response(
              data: response,
              statusCode: 200,
              requestOptions: RequestOptions(path: '/obterClientes'),
            ),
          );

          // AÇÃO
          final customers = await customersRemoteDataSource.fetchCustomers();

          // VERIFICAÇÃO
          expect(customers, equals(CustomersFixtures.tModels));
        },
      );

      test(
        'Quando ... deve ...',
        () async {
          // PREPARAÇÃO
          when(
            dioMock.get(any),
          ).thenAnswer(
            (_) async => Response(
              data: {},
              statusCode: 404,
              requestOptions: RequestOptions(path: '/obterClientes'),
            ),
          );

          // AÇÃO
          final call = customersRemoteDataSource.fetchCustomers;

          // VERIFICAÇÃO
          await expectLater(call(), throwsA(const TypeMatcher<Exception>()));
        },
      );
    });
  });
}
