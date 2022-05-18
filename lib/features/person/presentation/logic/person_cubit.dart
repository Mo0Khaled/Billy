import 'package:billy/core/constant/locale_db_keys.dart';
import 'package:billy/core/usecases/use_case.dart';
import 'package:billy/features/person/data/form/person_form.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:billy/features/person/domain/use_cases/create_person_use_case.dart';
import 'package:billy/features/person/domain/use_cases/delete_person_use_case.dart';
import 'package:billy/features/person/domain/use_cases/get_person_use_case.dart';
import 'package:billy/features/person/domain/use_cases/get_persons_use_case.dart';
import 'package:billy/features/person/domain/use_cases/update_person_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  final CreatePersonUseCase createPersonUseCase;
  final GetPersonsUseCase getPersonsUseCase;
  final GetPersonUseCase getPersonUseCase;
  final DeletePersonUseCase deletePersonUseCase;
  final UpdatePersonUseCase updatePersonUseCase;
  final Uuid uuid;
  PersonCubit({
    required this.createPersonUseCase,
    required this.getPersonsUseCase,
    required this.getPersonUseCase,
    required this.deletePersonUseCase,
    required this.updatePersonUseCase,
    required this.uuid,
  }) : super(PersonInitial());

  List<PersonEntity> persons = [];
  static final GlobalKey<FormState> personKey = GlobalKey<FormState>();
  PersonForm personForm = PersonForm();

  void validate() {
    personKey.currentState!.save();
    if (Formz.validate(personForm.inputs) == FormzStatus.valid) {
      emit(const PersonValid());
      return;
    }
    emit(const PersonUnValid());
  }

  Future<void> createPerson() async {
    final id = uuid.v1();
    print(id);
    final PersonModel personModel = PersonModel(
      name: personForm.nameField.value,
      phone: personForm.phoneField.value,
      id: id,
    );
    emit(PersonLoading());
    final failureOrData = await createPersonUseCase(
      CreatePersonUseCaseParams(person: personModel),
    );
    failureOrData.fold(
        (failure) => emit(
              PersonFailure(),
            ), (data) {
      persons.add(personModel);
      emit(
        PersonAddedSuccessfully(),
      );
    });
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
      (person) {
        persons.removeAt(person);
        emit(PersonDeletedSuccessfully());
      },
    );
  }

  Future<void> updatePerson(PersonModel updatedPerson) async {
    emit(PersonLoading());
    final failureOrData = await updatePersonUseCase(
        UpdatePersonParams(personModel: updatedPerson));
    failureOrData.fold(
      (failure) => emit(PersonFailure()),
      (person) {
        final personIndex =
            persons.indexWhere((element) => element.id == updatedPerson.id);
        persons[personIndex] = updatedPerson;
        emit(PersonUpdatedSuccessfully(updatedPerson: updatedPerson));
      },
    );
  }
}
