import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/config/dependencies.dart';
import 'package:mob4pay_tech_challenge/src/config/router.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/data_sources/customers_local_data_source.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/data_sources/customers_remote_data_source.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/repositories/customers_repository.dart';
import 'package:mob4pay_tech_challenge/src/data/services/local_storage.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/use_cases/customers_sync_use_case.dart';
import 'package:mob4pay_tech_challenge/src/ui/customers/viewmodels/customers_viewmodel.dart';
import 'package:mob4pay_tech_challenge/src/ui/services/toast_service.dart';
import 'package:mob4pay_tech_challenge/src/ui/splash/viewmodels/splash_viewmodel.dart';
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
        'Deve retornar uma instância do CustomersRepository quando esta '
        'dependência for necessária',
        () {
          // AÇÃO
          final database = getIt<CustomersRepository>();

          // VERIFICAÇÃO
          expect(database, isA<CustomersRepository>());
        },
      );

      test(
        'Deve retornar uma instância do AppRouter quando esta dependência for '
        'necessária',
        () {
          // AÇÃO
          final database = getIt<AppRouter>();

          // VERIFICAÇÃO
          expect(database, isA<AppRouter>());
        },
      );

      test(
        'Deve retornar uma instância do SplashViewmodel quando esta dependência'
        ' for necessária',
        () {
          // AÇÃO
          final database = getIt<SplashViewmodel>();

          // VERIFICAÇÃO
          expect(database, isA<SplashViewmodel>());
        },
      );

      test(
        'Deve retornar uma instância do CustomersViewmodel quando esta '
        'dependência for necessária',
        () {
          // AÇÃO
          final database = getIt<CustomersViewmodel>();

          // VERIFICAÇÃO
          expect(database, isA<CustomersViewmodel>());
        },
      );

      test(
        'Deve retornar uma instância do ToastService quando esta dependência'
        ' for necessária',
        () {
          // AÇÃO
          final database = getIt<ToastService>();

          // VERIFICAÇÃO
          expect(database, isA<ToastService>());
        },
      );

      test(
        'Deve retornar uma instância do CustomersSyncUseCase quando esta dependência'
        ' for necessária',
        () {
          // AÇÃO
          final database = getIt<CustomersSyncUseCase>();

          // VERIFICAÇÃO
          expect(database, isA<CustomersSyncUseCase>());
        },
      );
    });
  });
}
