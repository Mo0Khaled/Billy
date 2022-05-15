part of 'person_cubit.dart';

abstract class PersonState extends Equatable {
  const PersonState();
}

class PersonInitial extends PersonState {
  @override
  List<Object> get props => [];
}

class PersonLoading extends PersonState {
  @override
  List<Object> get props => [];
}

class PersonGetSuccessfully extends PersonState {
  final List<PersonEntity> personList;

  const PersonGetSuccessfully({required this.personList});

  @override
  List<Object> get props => [personList];
}

class GetSinglePersonSuccessfully extends PersonState {
  final PersonEntity person;

  const GetSinglePersonSuccessfully({required this.person});

  @override
  List<Object> get props => [person];
}

class PersonAddedSuccessfully extends PersonState {
  @override
  List<Object> get props => [];
}

class PersonDeletedSuccessfully extends PersonState {
  @override
  List<Object> get props => [];
}

class PersonUpdatedSuccessfully extends PersonState {
  final PersonModel updatedPerson;

  const PersonUpdatedSuccessfully({required this.updatedPerson});

  @override
  List<Object> get props => [updatedPerson];
}

class PersonFailure extends PersonState {
  @override
  List<Object> get props => [];
}
