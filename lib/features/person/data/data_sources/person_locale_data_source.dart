import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';

abstract class PersonLocaleDataSource {
  Future<void> createPerson(PersonModel person);

  Future<int> deletePerson(String id);

  Future<PersonModel> getPerson(String id);

  Future<List<PersonModel>> getPersons();

  Future<PersonModel> updatePerson(PersonModel person);
}
