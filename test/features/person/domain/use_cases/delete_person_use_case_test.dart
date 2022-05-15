import 'package:billy/features/person/domain/repositories/person_repository.dart';
import 'package:billy/features/person/domain/use_cases/delete_person_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPersonRepository extends Mock implements PersonRepository {}

void main() {
  late MockPersonRepository mockPersonRepository;
  late DeletePersonUseCase useCase;

  setUp(() {
    mockPersonRepository = MockPersonRepository();
    useCase = DeletePersonUseCase(
      repository: mockPersonRepository,
    );
  });

  const tId = "id";
  test("should remove person obj by id from the person box", ()async{
    //arrange
    when(()=>mockPersonRepository.deletePerson(tId)).thenAnswer((invocation) async => const Right(0));

    // act

    final result = await useCase(tId);

    // assert

    expect(result, const Right(0));
    verify(()=> mockPersonRepository.deletePerson(tId)).called(1);
    verifyNoMoreInteractions(mockPersonRepository);
  });
}
