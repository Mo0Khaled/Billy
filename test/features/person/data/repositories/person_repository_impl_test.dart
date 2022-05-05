import 'package:billy/core/exceptions/exceptions.dart';
import 'package:billy/core/exceptions/failure.dart';
import 'package:billy/features/person/data/data_sources/person_locale_data_source.dart';
import 'package:billy/features/person/data/repositories/person_repository_impl.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPersonLocalDataSource extends Mock implements PersonLocaleDataSource {
}

void main() {
  late MockPersonLocalDataSource mockPersonLocalDataSource;
  late PersonRepositoryImpl repository;
  setUp(() {
    mockPersonLocalDataSource = MockPersonLocalDataSource();
    repository = PersonRepositoryImpl(
      localeDataSource: mockPersonLocalDataSource,
    );
  });

  const tPerson = PersonEntity(id: 1, name: 'name');
  group('create person', () {
    test('should return a void when the person is created successfully',
        () async {
      // arrange
      when(() => mockPersonLocalDataSource.createPerson(tPerson))
          .thenAnswer((_) async {});
      // act
      final result = await repository.createPerson(tPerson);
      // assert
      verify(() => mockPersonLocalDataSource.createPerson(tPerson)).called(1);
      expect(result, const Right(null));
    });

    test("should throws a cache failure if couldn't cache the person data",
        () async {
      // arrange
      when(() => mockPersonLocalDataSource.createPerson(tPerson))
          .thenThrow(CacheException());
      // act
      final result = await repository.createPerson(tPerson);

      // assert
      verify(() => mockPersonLocalDataSource.createPerson(tPerson)).called(1);
      expect(result, equals(Left(CacheFailure())));
    });
  });
}
