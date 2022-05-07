import 'package:billy/core/usecases/use_case.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:billy/features/person/domain/use_cases/create_person_use_case.dart';
import 'package:billy/features/person/domain/use_cases/get_persons_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  final CreatePersonUseCase createPersonUseCase;
  final GetPersonsUseCase getPersonsUseCase;

  PersonCubit(
      {required this.createPersonUseCase, required this.getPersonsUseCase})
      : super(PersonInitial());

  List<PersonEntity> persons = [];

  Future<void> createPerson({required PersonModel personModel}) async {
    emit(PersonLoading());
    final failureOrData = await createPersonUseCase(
        CreatePersonUseCaseParams(person: personModel));
    failureOrData.fold(
      (failure) => emit(
        PersonFailure(),
      ),
      (data) => emit(
        PersonAddedSuccessfully(),
      ),
    );
  }

  Future<void> getPersons() async {
    emit(PersonLoading());
    final failureOrData = await getPersonsUseCase(NoParams());
    failureOrData.fold(
        (failure) => emit(
              PersonFailure(),
            ), (data) {
      persons = data;
      emit(PersonGetSuccessfully(personList: persons));
    });
  }
}
