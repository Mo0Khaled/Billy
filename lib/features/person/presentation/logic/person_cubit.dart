import 'package:billy/core/constant/locale_db_keys.dart';
import 'package:billy/core/usecases/use_case.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:billy/features/person/domain/use_cases/create_person_use_case.dart';
import 'package:billy/features/person/domain/use_cases/delete_person_use_case.dart';
import 'package:billy/features/person/domain/use_cases/get_person_use_case.dart';
import 'package:billy/features/person/domain/use_cases/get_persons_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  final CreatePersonUseCase createPersonUseCase;
  final GetPersonsUseCase getPersonsUseCase;
  final GetPersonUseCase getPersonUseCase;
  final DeletePersonUseCase deletePersonUseCase;

  PersonCubit({
    required this.createPersonUseCase,
    required this.getPersonsUseCase,
    required this.getPersonUseCase,
    required this.deletePersonUseCase,
  }) : super(PersonInitial());

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

  Future<void> getPerson(String id) async {
    emit(PersonLoading());
    final failureOrData = await getPersonUseCase(GetPersonParams(id: id));
    failureOrData.fold(
      (failure) => emit(PersonFailure()),
      (person) => emit(GetSinglePersonSuccessfully(person: person)),
    );
  }

  Future<void> deletePerson(String id) async {
    emit(PersonLoading());
    final failureOrData = await deletePersonUseCase(id);
    failureOrData.fold(
      (failure) => emit(PersonFailure()),
      (person) => emit(PersonDeletedSuccessfully()),
    );
  }
}
