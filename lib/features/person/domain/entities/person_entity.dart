class PersonEntity {
  final int id;
  final String name;
  final String? phone;

  PersonEntity({
    required this.id,
    required this.name,
    this.phone,
  });
}
