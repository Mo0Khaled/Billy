import 'package:billy/core/constant/locale_db_keys.dart';
import 'package:billy/features/person/data/data_sources/person_locale_data_source.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class PersonLocaleDataSourceImpl implements PersonLocaleDataSource {
  final Box hiveBox;

  PersonLocaleDataSourceImpl({required this.hiveBox});

  @override
  Future<void> createPerson(PersonModel person) async {
    final personMap = person.toJson(id: person.id!);
    await hiveBox.add(personMap);
  }

  @override
  Future<void> deletePerson(String id) {
    // TODO: implement deletePerson
    throw UnimplementedError();
  }

  @override
  Future<PersonModel> getPerson(String id) async {
    final personList = hiveBox.values;
    final personBox = personList
        .firstWhere((element) => (element as Map<String, dynamic>)['id'] == id);
    final person = PersonModel.fromJson(personBox as Map<dynamic, dynamic>);
    return person;
  }

  @override
  Future<List<PersonModel>> getPersons() async {
    return hiveBox.values
        .map((person) => PersonModel.fromJson(person as Map<dynamic, dynamic>))
        .toList();
  }

  @override
  Future<PersonModel> updatePerson(PersonModel person) {
    // TODO: implement updatePerson
    throw UnimplementedError();
  }
}
