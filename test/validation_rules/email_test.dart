import 'package:billy/core/validation_rules/email.dart';
import 'package:billy/core/validation_rules/not_empty.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late EmailField emailField;
  setUp(() {
    emailField = const EmailField.pure();
  });

  test("should return null if the value is an valid formatted email", () {
    final List<String> emails = [
      "mohamed@yahoo.com",
      "mohamed@gmail.net",
    ];

    for (final email in emails) {
      emailField =  EmailField.dirty(email);
      expect(
        emailField.validator(emailField.value),
        isNull,
      );
    }
  });

  test("should return invalid if the value is not an valid formatted email", () {
    final List<String> invalidEmails = [
      "mohamed@yahoocom.",
      "mohamedgmail.net",
    ];

    for (final email in invalidEmails) {
      emailField =  EmailField.dirty(email);
      expect(
        emailField.validator(emailField.value),
        EmailValidationError.invalid,
      );
    }
  });

}
