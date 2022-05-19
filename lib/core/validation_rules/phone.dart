import 'package:formz/formz.dart';

enum PhoneValidationError { invalid }

class PhoneField extends FormzInput<String, PhoneValidationError> {
  const PhoneField.pure([String value = '']) : super.pure(value);

  const PhoneField.dirty([String value = '']) : super.dirty(value);
  static final _phoneRegex = RegExp(r"^(01)[0125](\d{8)}");

  @override
  PhoneValidationError? validator(String value) {
    return _phoneRegex.hasMatch(value) ? null : PhoneValidationError.invalid;
  }
}
