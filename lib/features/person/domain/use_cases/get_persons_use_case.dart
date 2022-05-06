import 'package:billy/core/exceptions/failure.dart';
import 'package:billy/core/usecases/use_case.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/repositories/person_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetPersonsUseCase extends UseCase<List<PersonModel>, NoParams> {
  final PersonRepository repository;

  GetPersonsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<PersonModel>>> call(NoParams params) async{
    return repository.getPersons();
  }

}
