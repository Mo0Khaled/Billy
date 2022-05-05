import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';

abstract class PersonLocaleDataSource {
  Future<void> createPerson(PersonModel person) {
    // TODO: implement createPerson
    throw UnimplementedError();
  }

  Future<void> deletePerson(String id) {
    // TODO: implement deletePerson
    throw UnimplementedError();
  }

  Future<PersonEntity> getPerson(String id) {
    // TODO: implement getPerson
    throw UnimplementedError();
  }

  Future<List<PersonEntity>> getPersons() {
    // TODO: implement getPersons
    throw UnimplementedError();
  }

  Future<PersonEntity> updatePerson(PersonModel person) {
    // TODO: implement updatePerson
    throw UnimplementedError();
  }
}
