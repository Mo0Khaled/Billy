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
  @override
  List<Object> get props => [];
}

class PersonAddedSuccessfully extends PersonState {
  @override
  List<Object> get props => [];
}

class PersonDeletedSuccessfully extends PersonState {
  @override
  List<Object> get props => [];
}

class PersonFailure extends PersonState {
  @override
  List<Object> get props => [];
}
