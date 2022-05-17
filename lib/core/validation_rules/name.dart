import 'package:formz/formz.dart';

enum NameValidationError { invalid }

class NameField extends FormzInput<String, NameValidationError> {
  const NameField.pure([String value = '']) : super.pure(value);
  const NameField.dirty([String value = '']) : super.dirty(value);

  static final _nameRegex = RegExp(r"^([a-zA-Z]{2,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)");

  @override
  NameValidationError? validator(String? value) {
    return _nameRegex.hasMatch(value ?? '')
        ? null
        : NameValidationError.invalid;
  }
}