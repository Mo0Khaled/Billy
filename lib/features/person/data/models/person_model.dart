import 'package:billy/features/person/domain/entities/person_entity.dart';

class PersonModel extends PersonEntity {
  const PersonModel({required int? id, required String name, String? phone})
      : super(id: id, name: name, phone: phone);

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        id: json['id'] as int,
        name: json['name'] as String,
        phone: json['phone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
      };
}
