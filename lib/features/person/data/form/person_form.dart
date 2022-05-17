import 'package:billy/core/validation_rules/name.dart';
import 'package:billy/core/validation_rules/phone.dart';
import 'package:formz/formz.dart';

class PersonForm with FormzMixin {
  NameField nameField;
  PhoneField phoneField;

  PersonForm({
    this.nameField =const NameField.pure(),
    this.phoneField = const PhoneField.pure(),
  });

  @override
  List<FormzInput> get inputs => [nameField,phoneField];
}
