import 'package:billy/core/exceptions/failure.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PersonRepository {
  Future<Either<Failure, PersonEntity>> getPerson(String id);

  Future<Either<Failure, List<PersonEntity>>> getPersons();

  Future<Either<Failure, void>> createPerson(PersonEntity person);

  Future<Either<Failure, PersonEntity>> updatePerson(PersonEntity person);

  Future<Either<Failure, void>> deletePerson(String id);
}
