import 'package:billy/core/theme/app_theme.dart';
import 'package:billy/features/person/domain/entities/person_entity.dart';
import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  final PersonEntity personEntity;

  const PersonCard({Key? key, required this.personEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.1,
            blurRadius: 5,
            offset: const Offset(1, 5)),
      ]),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: AppTheme.lightPrimaryColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                personEntity.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                personEntity.phone!.isNotEmpty
                    ? personEntity.phone!
                    : "No Phone Number Included",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
