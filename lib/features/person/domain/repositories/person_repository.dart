import 'package:billy/core/exceptions/failure.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PersonRepository {
  Future<Either<Failure, PersonModel>> getPerson(String id);

  Future<Either<Failure, List<PersonModel>>> getPersons();

  Future<Either<Failure, void>> createPerson(PersonModel person);

  Future<Either<Failure, PersonModel>> updatePerson(PersonModel person);

  Future<Either<Failure, void>> deletePerson(String id);
}
