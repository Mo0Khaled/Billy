import 'package:billy/core/exceptions/failure.dart';
import 'package:billy/core/usecases/use_case.dart';
import 'package:billy/features/person/domain/repositories/person_repository.dart';
import 'package:dartz/dartz.dart';

class DeletePersonUseCase extends UseCase<int, String> {
  final PersonRepository repository;

  DeletePersonUseCase({required this.repository});

  @override
  Future<Either<Failure, int>> call(String personId) {
    return repository.deletePerson(personId);
  }
}
