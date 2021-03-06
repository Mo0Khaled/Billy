import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:uuid/uuid.dart';

class PersonModel extends PersonEntity {
  const PersonModel({required String? id, required String name, String? phone})
      : super(id: id, name: name, phone: phone);

  factory PersonModel.fromJson(Map<dynamic, dynamic> json) => PersonModel(
        id: json['id'] as String,
        name: json['name'] as String,
        phone: json['phone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
      };
}
