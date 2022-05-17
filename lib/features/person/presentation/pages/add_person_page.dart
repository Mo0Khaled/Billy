import 'package:billy/core/validation_rules/name.dart';
import 'package:billy/core/validation_rules/phone.dart';
import 'package:billy/features/person/presentation/logic/person_cubit.dart';
import 'package:billy/features/person/presentation/logic/person_cubit.dart';
import 'package:billy/features/person/presentation/widgets/add_person_button.dart';
import 'package:billy/injection_container.dart';
import 'package:billy/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPersonPage extends StatelessWidget {
  const AddPersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final personCubit = InjectionContainer.locator<PersonCubit>();

    return BlocConsumer<PersonCubit, PersonState>(
      listener: (context,state){
        if(state is PersonValid&& state is !PersonLoading){
          personCubit.createPerson();
        }

      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const SizedBox(
            width: 100,
            height: 100,
            child: AddPersonButton(),
          ),
          appBar: AppBar(
            elevation: 0.0,
            title: const Text(
              "Add Person",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0).copyWith(top: 30),
              child: Form(
                key: PersonCubit.personKey,
                child: Column(
                  children: [
                    CustomTextField(
                      errorText: personCubit.personForm.nameField.invalid ? "Please enter your first and last name" : null,
                      prefixIcon: Icons.person,
                      label: "Name",
                      hintTitle: "What is the person's name",
                      onSave: (name) {
                        personCubit.personForm.nameField = NameField.dirty(name ?? '');
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      errorText:  personCubit.personForm.phoneField.invalid ? "Please enter your phone number" : null,
                      prefixIcon: Icons.phone,
                      label: "Phone",
                      hintTitle: "What is the person's phone number",
                      onSave: (phone) {
                        personCubit.personForm.phoneField = PhoneField.dirty(phone ?? '');

                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
