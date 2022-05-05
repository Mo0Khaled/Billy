import 'package:billy/core/exceptions/failure.dart';
import 'package:billy/core/usecases/use_case.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:billy/features/person/domain/repositories/person_repository.dart';
import 'package:dartz/dartz.dart';

class CreatePersonUseCase extends UseCase<void, CreatePersonUseCaseParams> {
  final PersonRepository repository;

  CreatePersonUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(CreatePersonUseCaseParams params) {
    return repository.createPerson(params.person);
  }
}

class CreatePersonUseCaseParams {
  final PersonModel person;

  CreatePersonUseCaseParams({required this.person});
}
