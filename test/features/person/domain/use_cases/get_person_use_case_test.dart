import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/repositories/person_repository.dart';
import 'package:billy/features/person/domain/use_cases/get_person_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPersonRepository extends Mock implements PersonRepository {}

void main() {
  late MockPersonRepository mockPersonRepository;
  late GetPersonUseCase useCase;

  setUp(() {
    mockPersonRepository = MockPersonRepository();
    useCase = GetPersonUseCase(repository: mockPersonRepository);
  });
  const String tId = "1";

  const tPerson =  PersonModel(
    id: "1",
    name: 'name',
    phone: 'phone',
  );
  test("should get person by entering the id from repository", () async {
    // arrange
    when(()=>mockPersonRepository.getPerson(tId)).thenAnswer((_)async=>const Right(tPerson));
    // act
    final result = await useCase(const GetPersonParams(id: tId));
    // assert
    verify(()=>mockPersonRepository.getPerson(tId)).called(1);
    expect(result, const Right(tPerson));
  });
}
