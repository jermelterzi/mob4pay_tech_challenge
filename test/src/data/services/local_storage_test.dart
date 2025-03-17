import 'package:flutter_test/flutter_test.dart';
import 'package:mob4pay_tech_challenge/src/data/services/local_storage.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';

@GenerateNiceMocks([MockSpec<Database>()])
import 'local_storage_test.mocks.dart';

void main() {
  late final MockDatabase databaseMock;
  late final LocalStorage localStorage;

  setUpAll(() {
    databaseMock = MockDatabase();
    localStorage = LocalStorageImpl(database: databaseMock);
  });

  group('LocalStorage -', () {
    group('getAll:', () {
      test(
        'Deve retornar todos os dados referentes a referência passada por '
        'parâmetro quando este método for chamado',
        () async {
          // PREPARAÇÃO
          when(databaseMock.query(any)).thenAnswer((_) async => []);

          // AÇÃO
          final customers = await localStorage.getAll(table: 'customers');

          // VERIFICAÇÃO
          expect(customers, equals([]));
        },
      );
    });

    group('removeAll:', () {
      test(
        'Deve remover todos os dados referentes a referência passada por '
        'parâmetro quando este método for chamado',
        () async {
          // PREPARAÇÃO
          when(databaseMock.delete(any)).thenAnswer((_) async => 10);

          // AÇÃO
          await localStorage.removeAll(table: 'customers');

          // VERIFICAÇÃO
          verify(databaseMock.delete('customers')).called(1);
        },
      );
    });

    group('save:', () {
      test(
        'Deve salvar os valores passados por parâmetro na referência passada'
        ' por parâmetro quando este método for chamado',
        () async {
          // PREPARAÇÃO
          when(
            databaseMock.insert(
              any,
              any,
              conflictAlgorithm: anyNamed('conflictAlgorithm'),
            ),
          ).thenAnswer(
            (_) async => 1,
          );

          // AÇÃO
          await localStorage.save(table: 'customers', value: {});

          // VALIDAÇÃO
          verify(
            databaseMock.insert(
              'customers',
              {},
              conflictAlgorithm: ConflictAlgorithm.replace,
            ),
          ).called(1);
        },
      );
    });
  });
}
