part of 'person_cubit.dart';

abstract class PersonState  {
  const PersonState();
}

class PersonInitial extends PersonState {
}

class PersonLoading extends Equatable implements PersonState {
  @override
  List<Object> get props => [];
}

class PersonGetSuccessfully extends Equatable implements PersonState {
  final List<PersonEntity> personList;

  const PersonGetSuccessfully({required this.personList});

  @override
  List<Object> get props => [personList];
}

class GetSinglePersonSuccessfully extends Equatable implements PersonState {
  final PersonEntity person;

  const GetSinglePersonSuccessfully({required this.person});

  @override
  List<Object> get props => [person];
}

class PersonAddedSuccessfully extends Equatable implements PersonState {
  @override
  List<Object> get props => [];
}

class PersonDeletedSuccessfully extends Equatable implements PersonState {
  @override
  List<Object> get props => [];
}

class PersonUpdatedSuccessfully extends Equatable implements PersonState {
  final PersonModel updatedPerson;

  const PersonUpdatedSuccessfully({required this.updatedPerson});

  @override
  List<Object> get props => [updatedPerson];
}

class PersonFailure extends Equatable implements PersonState {
  @override
  List<Object> get props => [];
}

class PersonValid extends Equatable implements PersonState {

  const PersonValid();

  @override
  List<Object> get props => [];
}

class PersonUnValid extends PersonState {

  const PersonUnValid();


}
