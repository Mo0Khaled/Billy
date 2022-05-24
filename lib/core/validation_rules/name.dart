import 'package:easy_breezy_validator/validator.dart';
import 'package:formz/formz.dart';
enum NameValidationError { invalid }

class NameField extends FormzInput<String, NameValidationError> {
  const NameField.pure([String value = '']) : super.pure(value);
  const NameField.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String? value) {

    return isFullName(value ?? '')
        ? null
        : NameValidationError.invalid;
  }
}