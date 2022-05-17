import 'package:billy/core/validation_rules/not_empty.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late NotEmptyField notEmptyField;
  setUp(() {
    notEmptyField = const NotEmptyField.pure();
  });

  test("should return null if the value is not empty", () {
    notEmptyField = const NotEmptyField.dirty("value");
    expect(
      notEmptyField.validator(notEmptyField.value),
      isNull,
    );
  });

  test("should return invalid if the value is empty", () {
    notEmptyField = const NotEmptyField.dirty("");

    expect(
      notEmptyField.validator(notEmptyField.value),
      NotEmptyValidationError.invalid,
    );
  });
}
