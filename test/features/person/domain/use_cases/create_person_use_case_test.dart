import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:billy/features/person/domain/repositories/person_repository.dart';
import 'package:billy/features/person/domain/use_cases/create_person_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPersonRepository extends Mock implements PersonRepository {}

void main() {
  late CreatePersonUseCase useCase;
  late MockPersonRepository repository;
  setUp(() {
    repository = MockPersonRepository();
    useCase = CreatePersonUseCase(repository: repository);
  });

  final tPerson = PersonEntity(
    id: 1,
    name: 'name',
    phone: 'phone',
  );
  test("should create a person and return the created obj back", () async {
    //arrange

    when(() => repository.createPerson(tPerson))
        .thenAnswer((invocation) async => const Right(null));
    // act
    final result = await useCase(CreatePersonUseCaseParams(person:tPerson));
    // assert
    expect(result, const Right(null));
    verify(()=> repository.createPerson(tPerson)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
