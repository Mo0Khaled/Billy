import 'package:formz/formz.dart';

enum NotEmptyValidationError { invalid }

class NotEmptyField extends FormzInput<String, NotEmptyValidationError> {
  const NotEmptyField.pure([String value = '']) : super.pure(value);

  const NotEmptyField.dirty(String value) : super.dirty(value);

  @override
  NotEmptyValidationError? validator(String value) {
    return value.isNotEmpty ? null : NotEmptyValidationError.invalid;
  }
}
