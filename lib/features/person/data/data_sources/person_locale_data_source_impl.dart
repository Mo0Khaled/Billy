import 'package:billy/core/exceptions/exceptions.dart';
import 'package:billy/features/person/data/data_sources/person_locale_data_source.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:hive/hive.dart';

class PersonLocaleDataSourceImpl implements PersonLocaleDataSource {
  final Box hiveBox;

  PersonLocaleDataSourceImpl({required this.hiveBox});

  @override
  Future<void> createPerson(PersonModel person) async {
    final personMap = person.toJson();
    await hiveBox.add(personMap);
  }

  @override
  Future<PersonModel> getPerson(String id) async {
    final personList = hiveBox.values;
    final personBox = personList.firstWhere(
        (element) => (element as Map<dynamic, dynamic>)['id'] == id);
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
  Future<PersonModel> updatePerson(PersonModel person) async {
    final it = hiveBox.values;
    final index = it.toList().indexWhere(
          (element) => (element as Map<dynamic, dynamic>)['id'] == person.id,
        );
    if (index != -1) {

      await hiveBox.putAt(index, person.toJson());

      return person;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<int> deletePerson(String id) async {
    final it = hiveBox.values;
    final index = it.toList().indexWhere(
          (element) => (element as Map<dynamic, dynamic>)['id'] == id,
        );
    if (index != -1) {
      await hiveBox.deleteAt(index);
      return index;
    } else {
      throw CacheException();
    }
  }
}
