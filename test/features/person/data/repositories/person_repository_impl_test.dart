import 'package:billy/core/exceptions/exceptions.dart';
import 'package:billy/core/exceptions/failure.dart';
import 'package:billy/features/person/data/data_sources/person_locale_data_source.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/data/repositories/person_repository_impl.dart';
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

  const tPerson = PersonModel(id: '1', name: 'name');
  const tPersonsList = [tPerson, tPerson, tPerson];
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

  group("get persons", () {
    test('should return a list of persons when there is one on the db',
        () async {
      // arrange
      when(() => mockPersonLocalDataSource.getPersons())
          .thenAnswer((_) async => tPersonsList);
      // act
      final result = await repository.getPersons();
      // assert
      verify(() => mockPersonLocalDataSource.getPersons()).called(1);
      expect(result, equals(const Right(tPersonsList)));
    });

    test('should throws a cache failure if there is no person on the db',
        () async {
      // arrange
      when(() => mockPersonLocalDataSource.getPersons())
          .thenThrow(CacheException());
      // act
      final result = await repository.getPersons();
      // assert
      verify(() => mockPersonLocalDataSource.getPersons()).called(1);
      expect(result, equals(Left(CacheFailure())));
    });
  });

  group("get person", () {
    const tId = 'id';
    test('should return a person when there is one on the db',
            () async {
          // arrange
          when(() => mockPersonLocalDataSource.getPerson(tId))
              .thenAnswer((_) async => tPerson);
          // act
          final result = await repository.getPerson(tId);
          // assert
          verify(() => mockPersonLocalDataSource.getPerson(tId)).called(1);
          expect(result, equals(const Right(tPerson)));
        });

    test('should throws a cache failure if there is no person on the db',
            () async {
          // arrange
          when(() => mockPersonLocalDataSource.getPerson(tId))
              .thenThrow(CacheException());
          // act
          final result = await repository.getPerson(tId);
          // assert
          verify(() => mockPersonLocalDataSource.getPerson(tId)).called(1);
          expect(result, equals(Left(CacheFailure())));
        });
  });

  group("delete person", () {
    const tId = 'id';
    test('should return a void when the person removed from the db',
            () async {
          // arrange
          when(() => mockPersonLocalDataSource.deletePerson(tId))
              .thenAnswer((_) async => 0);
          // act
          final result = await repository.deletePerson(tId);
          // assert
          verify(() => mockPersonLocalDataSource.deletePerson(tId)).called(1);
          expect(result, equals(const Right(0)));
        });

    test('should throws a cache failure if there is no person on the db',
            () async {
          // arrange
          when(() => mockPersonLocalDataSource.deletePerson(tId))
              .thenThrow(CacheException());
          // act
          final result = await repository.deletePerson(tId);
          // assert
          verify(() => mockPersonLocalDataSource.deletePerson(tId)).called(1);
          expect(result, equals(Left(CacheFailure())));
        });
  });

  group("update person", () {
    const tUpdatedPerson = PersonModel(id: '1', name: 'name',phone: "0123");

    test('should return a new person object when the person updated on the db',
            () async {
          // arrange
          when(() => mockPersonLocalDataSource.updatePerson(tPerson))
              .thenAnswer((_) async => tUpdatedPerson);
          // act
          final result = await repository.updatePerson(tPerson);
          // assert
          verify(() => mockPersonLocalDataSource.updatePerson(tPerson)).called(1);
          expect(result, equals(const Right(tUpdatedPerson)));
        });

    test('should throws a cache failure if there is no person on the db',
            () async {
          // arrange
          when(() => mockPersonLocalDataSource.updatePerson(tPerson))
              .thenThrow(CacheException());
          // act
          final result = await repository.updatePerson(tPerson);
          // assert
          verify(() => mockPersonLocalDataSource.updatePerson(tPerson)).called(1);
          expect(result, equals(Left(CacheFailure())));
        });
  });

}
