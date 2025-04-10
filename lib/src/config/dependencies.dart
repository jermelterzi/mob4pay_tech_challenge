import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mob4pay_tech_challenge/src/config/router.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/data_sources/customers_local_data_source.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/data_sources/customers_remote_data_source.dart';
import 'package:mob4pay_tech_challenge/src/data/customers/repositories/customers_repository.dart';
import 'package:mob4pay_tech_challenge/src/data/services/local_storage.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/use_cases/customers_sync_use_case.dart';
import 'package:mob4pay_tech_challenge/src/ui/customers/viewmodels/customers_viewmodel.dart';
import 'package:mob4pay_tech_challenge/src/ui/services/toast_service.dart';
import 'package:mob4pay_tech_challenge/src/ui/splash/viewmodels/splash_viewmodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt
    ..registerSingletonAsync<Database>(_initAppDatabase)
    ..registerLazySingleton<Dio>(_configureDio)
    ..registerLazySingleton<LocalStorage>(
      () => LocalStorageImpl(database: getIt()),
    )
    ..registerLazySingleton<CustomersLocalDataSource>(
      () => CustomersLocalDataSourceImpl(localStorage: getIt()),
    )
    ..registerLazySingleton<CustomersRemoteDataSource>(
      () => CustomersRemoteDataSource(getIt()),
    )
    ..registerLazySingleton<CustomersRepository>(
      () => CustomersRepositoryImpl(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
      ),
    )
    ..registerLazySingleton<AppRouter>(() => AppRouter())
    ..registerFactory<SplashViewmodel>(
      () => SplashViewmodel(customersSyncUseCase: getIt()),
    )
    ..registerFactory<CustomersViewmodel>(
      () => CustomersViewmodel(
        customersRepository: getIt(),
        customersSyncUseCase: getIt(),
      ),
    )
    ..registerFactory<ToastService>(() => ToastServiceImpl())
    ..registerLazySingleton<CustomersSyncUseCase>(
      () => CustomersSyncUseCaseImpl(customersRepository: getIt()),
    );

  await getIt.allReady();
}

Future<Database> _initAppDatabase() async {
  final databasePath = await getDatabasesPath();
  final database = openDatabase(
    join(databasePath, 'mob4pay_database.db'),
    version: 1,
    onCreate: (db, _) {
      return db.execute(
        'CREATE TABLE customers(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, email TEXT, address TEXT, city TEXT, state TEXT)',
      );
    },
  );

  return database;
}

Dio _configureDio() {
  final dio = Dio();

  dio.interceptors.add(CustomersInterceptor());

  return dio;
}
