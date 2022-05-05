import 'package:billy/core/constant/locale_db_keys.dart';
import 'package:billy/features/person/data/data_sources/person_locale_data_source_impl.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';

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

  group("store created person", () {
    const tPerson = PersonModel(id: null, name: 'name');
    final tPersonMap = tPerson.toJson();
    test('should store/cache the person object in the person box', () async {
      // arrange
      when(() => personBox.add(tPersonMap)).thenAnswer((_) async => 0);
      // act
      await personLocaleDataSource.createPerson(tPerson);
      // assert
      verify(() => personBox.add( tPersonMap)).called(1);
    });
  });
}
