import 'dart:convert';

import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const PersonModel tPersonModel = PersonModel(
    id: '1',
    name: 'John Doe',
    phone: '+55 11 99999-9999',
  );

  test("if the person model is the sub type of the person entity", () {
    expect(tPersonModel, isA<PersonEntity>());
  });

  group('fromJson', () {
    const PersonModel tPersonModelWithoutModel = PersonModel(
      id: '1',
      name: 'John Doe',
    );
    test(
        "should return a valid model when the json formatted correctly without the nullable properties",
        () {
      final Map<String, dynamic> personMap =
          jsonDecode(fixture('person')) as Map<String, dynamic>;
      final PersonModel returnedPersonModel = PersonModel.fromJson(personMap);

      expect(returnedPersonModel, tPersonModelWithoutModel);
    });

    test(
        "should return a valid model when the json formatted correctly with the nullable properties",
        () {
      final Map<String, dynamic> personMap =
          jsonDecode(fixture('person_with_phone')) as Map<String, dynamic>;
      final PersonModel returnedPersonModel = PersonModel.fromJson(personMap);

      expect(returnedPersonModel, tPersonModel);
    });
  });

  // test("should return a jsonMap with the proper data", () {
  //   final Map<String, dynamic> result = tPersonModel.toJson();
  //   final id = const Uuid().v1();
  //   final expectedMap = {
  //     'id': id,
  //     'name': 'John Doe',
  //     'phone': '+55 11 99999-9999',
  //   };
  //
  //   expect(result, expectedMap);
  // });
}
