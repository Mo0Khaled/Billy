import 'package:billy/core/validation_rules/email.dart';
import 'package:billy/core/validation_rules/name.dart';
import 'package:billy/core/validation_rules/not_empty.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late NameField nameField;
  setUp(() {
    nameField = const NameField.pure();
  });

  test("should return null if the value is an valid formatted email", () {
    final List<String> emails = [
      "mohamed khacs",
      "mohamed khacs",
    ];

    for (final email in emails) {
      nameField =  NameField.dirty(email);
      expect(
        nameField.validator(nameField.value),
        isNull,
      );
    }
  });

  test("should return invalid if the value is not an valid formatted email", () {
    final List<String> invalidEmails = [
      "mohamed",
      "mohamed.khaled",
    ];

    for (final email in invalidEmails) {
      nameField =  NameField.dirty(email);
      expect(
        nameField.validator(nameField.value),
        NameValidationError.invalid,
      );
    }
  });

}
