import 'package:billy/core/usecases/use_case.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/repositories/person_repository.dart';
import 'package:billy/features/person/domain/use_cases/get_persons_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPersonRepository extends Mock implements PersonRepository {}

void main() {
  late MockPersonRepository mockPersonRepository;
  late GetPersonsUseCase useCase;
  setUp(() {
    mockPersonRepository = MockPersonRepository();
    useCase = GetPersonsUseCase(repository: mockPersonRepository);
  });
  const tPerson = PersonModel(id: '1', name: 'name');
  const tPersonsList = [tPerson, tPerson, tPerson];
  test("should return a list of persons ", () async {
    // arrange
    when(() => mockPersonRepository.getPersons())
        .thenAnswer((_) async => const Right(tPersonsList));
    // act
    final result = await useCase(NoParams());
    // assert
    expect(result, const Right(tPersonsList));
    verify(() => mockPersonRepository.getPersons()).called(1);
    verifyNoMoreInteractions(mockPersonRepository);
  });
}
