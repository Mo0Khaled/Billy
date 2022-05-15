import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/repositories/person_repository.dart';
import 'package:billy/features/person/domain/use_cases/update_person_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPersonRepository extends Mock implements PersonRepository {}

void main() {
  late MockPersonRepository mockPersonRepository;
  late UpdatePersonUseCase useCase;
  setUp(() {
    mockPersonRepository = MockPersonRepository();
    useCase = UpdatePersonUseCase(
      repository: mockPersonRepository,
    );
  });

  const tPerson =  PersonModel(
    id: "1",
    name: 'name',
    phone: 'phone',
  );

  const tUpdatedPerson =  PersonModel(
    id: "1",
    name: 'x',
    phone: 'phone',
  );

  test("should return a new person obj after update the person", ()async{

    // arrange
    when(()=>mockPersonRepository.updatePerson(tPerson)).thenAnswer((_)async => const Right(tUpdatedPerson));
    //act
      final result = await useCase(const UpdatePersonParams(personModel: tPerson));
    //assert
    verify(()=>mockPersonRepository.updatePerson(tPerson)).called(1);
    expect(result, const Right(tUpdatedPerson));
    verifyNoMoreInteractions(mockPersonRepository);
  });
}
