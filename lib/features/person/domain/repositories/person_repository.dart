import 'package:billy/core/exceptions/failure.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:dartz/dartz.dart';

abstract class PersonRepository {
  Future<Either<Failure, PersonModel>> getPerson(String id);

  Future<Either<Failure, List<PersonModel>>> getPersons();

  Future<Either<Failure, void>> createPerson(PersonModel person);

  Future<Either<Failure, PersonModel>> updatePerson(PersonModel person);

  Future<Either<Failure, int>> deletePerson(String id);
}
