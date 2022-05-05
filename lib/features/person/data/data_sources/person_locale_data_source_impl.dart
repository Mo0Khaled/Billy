import 'package:billy/core/constant/locale_db_keys.dart';
import 'package:billy/features/person/data/data_sources/person_locale_data_source.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:hive/hive.dart';

class PersonLocaleDataSourceImpl implements PersonLocaleDataSource {
  final Box hiveBox;

  PersonLocaleDataSourceImpl({required this.hiveBox});

  @override
  Future<void> createPerson(PersonModel person) async {
    final personMap = person.toJson();
    await hiveBox.add(personMap);

    // await hiveBox.put(LocaleDbKeys.personsKey, personMap);
  }

  @override
  Future<void> deletePerson(String id) {
    // TODO: implement deletePerson
    throw UnimplementedError();
  }

  @override
  Future<PersonEntity> getPerson(String id) {
    // TODO: implement getPerson
    throw UnimplementedError();
  }

  @override
  Future<List<PersonEntity>> getPersons() {
    // TODO: implement getPersons
    throw UnimplementedError();
  }

  @override
  Future<PersonEntity> updatePerson(PersonModel person) {
    // TODO: implement updatePerson
    throw UnimplementedError();
  }
}
