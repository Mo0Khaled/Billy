import 'package:billy/features/person/domain/use_cases/create_person_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  final CreatePersonUseCase cratePersonUseCase;
  PersonCubit({required this.cratePersonUseCase}) : super(PersonInitial());
}
