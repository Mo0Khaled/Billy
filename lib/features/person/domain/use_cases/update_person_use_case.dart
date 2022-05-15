import 'package:billy/core/exceptions/failure.dart';
import 'package:billy/core/usecases/use_case.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/repositories/person_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdatePersonUseCase extends UseCase<PersonModel, UpdatePersonParams> {
  final PersonRepository repository;

  UpdatePersonUseCase({required this.repository});

  @override
  Future<Either<Failure, PersonModel>> call(UpdatePersonParams params) {
    return repository.updatePerson(params.personModel);
  }
}

class UpdatePersonParams extends Equatable {
  final PersonModel personModel;

  const UpdatePersonParams({required this.personModel});

  @override
  List<Object?> get props => [personModel];
}
