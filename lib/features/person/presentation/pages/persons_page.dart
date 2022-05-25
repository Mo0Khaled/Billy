import 'package:billy/core/theme/app_theme.dart';
import 'package:billy/features/person/presentation/logic/person_cubit.dart';
import 'package:billy/features/person/presentation/widgets/person_card.dart';
import 'package:billy/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonsPage extends StatelessWidget {
  const PersonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final personCubit = InjectionContainer.locator<PersonCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                child: const Text(
                  "Persons",
                  style: TextStyle(
                    color: AppTheme.lightPrimaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: BlocBuilder<PersonCubit, PersonState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: personCubit.persons.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          PersonCard(
                            personEntity: personCubit.persons[index],
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
