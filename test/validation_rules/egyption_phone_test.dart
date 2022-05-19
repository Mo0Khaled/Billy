import 'package:billy/core/validation_rules/phone.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PhoneField phoneField;
  setUp(() {
    phoneField = const PhoneField.pure();
  });

  group('valid tests', () {
    const List<String> validPhones = [
      '01113294828',
      '01013294828',
      '01213294828',
      '01513294828',
    ];

   test("should return null if the phone regex has mathed", () {
     for (final phone in validPhones) {
       phoneField = PhoneField.dirty(phone);
       expect(phoneField.validator(phoneField.value), isNull);
     }
   });
  });

  group('inValid tests', () {
    const List<String> inValidPhones = [
      '01713294828',
      '10013294828',
      '0121329482',
      '015132948284',
    ];

    test("should return null if the phone regex has mathed", () {
      for (final phone in inValidPhones) {
        phoneField = PhoneField.dirty(phone);
        expect(phoneField.validator(phoneField.value), PhoneValidationError.invalid);
      }
    });
  });
}
