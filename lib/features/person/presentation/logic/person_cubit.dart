import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/use_cases/create_person_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  final CreatePersonUseCase createPersonUseCase;

  PersonCubit({required this.createPersonUseCase}) : super(PersonInitial());

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
}
