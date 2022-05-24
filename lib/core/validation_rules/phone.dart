import 'package:formz/formz.dart';
import 'package:easy_breezy_validator/validator.dart';

enum PhoneValidationError { invalid }

class PhoneField extends FormzInput<String, PhoneValidationError> {
  const PhoneField.pure([String value = '']) : super.pure(value);

  const PhoneField.dirty([String value = '']) : super.dirty(value);
  @override
  PhoneValidationError? validator(String value) {
    return isEgyptianPhone(value) ? null : PhoneValidationError.invalid;
  }
}
