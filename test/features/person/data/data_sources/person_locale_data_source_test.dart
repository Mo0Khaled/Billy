import 'package:billy/core/constant/locale_db_keys.dart';
import 'package:billy/features/person/data/data_sources/person_locale_data_source_impl.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uuid/uuid.dart';

class MockHive extends Mock implements HiveInterface {}

class MockHiveBox extends Mock implements Box {}

void main() {
  late PersonLocaleDataSourceImpl personLocaleDataSource;
  late MockHive hive;
  late MockHiveBox personBox;
  setUp(() async {
    hive = MockHive();
    await hive.initFlutter();
    personBox = MockHiveBox();

    personLocaleDataSource = PersonLocaleDataSourceImpl(hiveBox: personBox);
  });
  final id = const Uuid().v1();

  final tPerson = PersonModel(id: id, name: 'name',phone: 'phone');
  final tPersonsList = [tPerson.toJson(id: id),tPerson.toJson(id: id),tPerson.toJson(id: id)];

  group("store created person", () {
    final tPersonMap = tPerson.toJson(id: id);
    test('should store/cache the person object in the person box', () async {
      // arrange
      when(() => personBox.add(tPersonMap)).thenAnswer((_) async => 0);
      // act
      await personLocaleDataSource.createPerson(tPerson);
      // assert
      verify(() => personBox.add(tPersonMap)).called(1);
    });
  });

  group("get persons", () {
    test('should store/cache the person object in the person box', () async {
      // arrange
      when(() => personBox.values).thenReturn(tPersonsList);
      // act
      await personLocaleDataSource.getPersons();
      // assert
      verify(() => personBox.values).called(1);
    });
  });
}
