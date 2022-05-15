import 'package:billy/core/exceptions/exceptions.dart';
import 'package:billy/core/exceptions/failure.dart';
import 'package:billy/features/person/data/data_sources/person_locale_data_source.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:billy/features/person/domain/repositories/person_repository.dart';
import 'package:dartz/dartz.dart';

class PersonRepositoryImpl implements PersonRepository {
  final PersonLocaleDataSource localeDataSource;

  PersonRepositoryImpl({required this.localeDataSource});

  @override
  Future<Either<Failure, void>> createPerson(PersonModel person) async {
    try {
      await localeDataSource.createPerson(person);
      return const Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<PersonModel>>> getPersons() async {
    try {
      final personsList = await localeDataSource.getPersons();
      return Right(personsList);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, PersonModel>> getPerson(String id) async {
    try {
      final person = await localeDataSource.getPerson(id);
      return Right(person);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, PersonModel>> updatePerson(PersonEntity person) {
    // TODO: implement updatePerson
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> deletePerson(String id) async {
    try {
   final deletedIndex =    await localeDataSource.deletePerson(id);
      return Right(deletedIndex);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
