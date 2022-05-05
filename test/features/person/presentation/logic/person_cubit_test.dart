import 'package:billy/core/exceptions/failure.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/use_cases/create_person_use_case.dart';
import 'package:billy/features/person/presentation/logic/person_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCreatePersonUseCase extends Mock implements CreatePersonUseCase {}

void main() {
  late MockCreatePersonUseCase mockCreatePersonUseCase;
  late PersonCubit personCubit;
  setUp(() {
    mockCreatePersonUseCase = MockCreatePersonUseCase();
    personCubit = PersonCubit(
      createPersonUseCase: mockCreatePersonUseCase,
    );
  });

  group('createPerson', () {
    const tPerson = PersonModel(id: 1, name: 'name');
    test(
        'should emit [PersonLoading,PersonAddedSuccessfully] when the person is created successfully',
        () async {
      // arrange
      when(() => mockCreatePersonUseCase(
            const CreatePersonUseCaseParams(person: tPerson),
          )).thenAnswer((_) async => const Right(null));
      // assert later
      final expectedStates = [
        PersonLoading(),
        PersonAddedSuccessfully(),
      ];
      expectLater(personCubit.stream, emitsInOrder(expectedStates));
      // act

      await personCubit.createPerson(personModel: tPerson);
    });

    test(
        'should emit [PersonLoading,PersonFailure] when the person is could not created',
            () async {
          // arrange
          when(() => mockCreatePersonUseCase(
            const CreatePersonUseCaseParams(person: tPerson),
          )).thenAnswer((_) async =>  Left(CacheFailure()));
          // assert later
          final expectedStates = [
            PersonLoading(),
            PersonFailure(),
          ];
          expectLater(personCubit.stream, emitsInOrder(expectedStates));
          // act

          await personCubit.createPerson(personModel: tPerson);
        });
  });
}
