import 'package:formz/formz.dart';
import 'package:easy_breezy_validator/validator.dart';

enum EmailValidationError { invalid }

class EmailField extends FormzInput<String, EmailValidationError> {
  const EmailField.pure([String value = '']) : super.pure(value);
  const EmailField.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    return isEmail(value ?? '')
        ? null
        : EmailValidationError.invalid;
  }
}
