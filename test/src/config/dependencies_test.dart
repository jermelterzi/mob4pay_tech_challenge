import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/config/dependencies.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/data_sources/customers_local_data_source.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/data_sources/customers_remote_data_source.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/repositories/customers_repository.dart';
import 'package:mob4pay_tech_challenge/src/data/services/local_storage.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('Dependencies -', () {
    group('setupDependencies:', () {
      setUpAll(() async {
        databaseFactory = databaseFactoryFfi;

        await setupDependencies();
      });

      test(
        'Deve retornar uma instância do banco de dados do aplicativo quando '
        'esta dependência for necessária',
        () {
          // AÇÃO
          final database = getIt<Database>();

          // VERIFICAÇÃO
          expect(database, isA<Database>());
        },
      );

      test(
        'Deve retornar uma instância do Dio quando esta dependência for '
        'necessária',
        () {
          // AÇÃO
          final database = getIt<Dio>();

          // VERIFICAÇÃO
          expect(database, isA<Dio>());
        },
      );

      test(
        'Deve retornar uma instância do LocalStorage quando esta dependência for '
        'necessária',
        () {
          // AÇÃO
          final database = getIt<LocalStorage>();

          // VERIFICAÇÃO
          expect(database, isA<LocalStorage>());
        },
      );

      test(
        'Deve retornar uma instância do CustomersLocalDataSource quando esta '
        'dependência for necessária',
        () {
          // AÇÃO
          final database = getIt<CustomersLocalDataSource>();

          // VERIFICAÇÃO
          expect(database, isA<CustomersLocalDataSource>());
        },
      );

      test(
        'Deve retornar uma instância do CustomersRemoteDataSource quando esta '
        'dependência for necessária',
        () {
          // AÇÃO
          final database = getIt<CustomersRemoteDataSource>();

          // VERIFICAÇÃO
          expect(database, isA<CustomersRemoteDataSource>());
        },
      );

      test(
        'Deve retornar uma instância do CustomersRemoteDataSource quando esta '
        'dependência for necessária',
        () {
          // AÇÃO
          final database = getIt<CustomersRepository>();

          // VERIFICAÇÃO
          expect(database, isA<CustomersRepository>());
        },
      );
    });
  });
}
