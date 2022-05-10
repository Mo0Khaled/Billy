import 'package:billy/core/exceptions/failure.dart';
import 'package:billy/core/usecases/use_case.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/repositories/person_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetPersonUseCase extends UseCase<PersonModel , GetPersonParams>{
  final PersonRepository repository;

  GetPersonUseCase({required this.repository});

  @override
  Future<Either<Failure, PersonModel>> call(GetPersonParams params) {
    return repository.getPerson(params.id);
  }

}



class GetPersonParams extends Equatable {
 final String id;

 const GetPersonParams({required this.id});

  @override
  List<Object?> get props => [];
}
