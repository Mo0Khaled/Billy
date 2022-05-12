import 'package:billy/features/person/domain/repositories/person_repository.dart';
import 'package:billy/features/person/domain/use_cases/delete_person_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPersonRepository extends Mock implements PersonRepository {}

void main() {
  late MockPersonRepository mockPersonRepository;
  late RemovePersonUseCase useCase;

  setUp(() {
    mockPersonRepository = MockPersonRepository();
    useCase = RemovePersonUseCase(
      repository: mockPersonRepository,
    );
  });

  const tId = "id";
  test("should remove person obj by id from the person box", ()async{
    //arrange
    when(()=>mockPersonRepository.deletePerson(tId)).thenAnswer((invocation) async => const Right({}));

    // act

    final result = await useCase(tId);

    // assert

    expect(result, const Right({}));
    verify(()=> mockPersonRepository.deletePerson(tId)).called(1);
    verifyNoMoreInteractions(mockPersonRepository);
  });
}
