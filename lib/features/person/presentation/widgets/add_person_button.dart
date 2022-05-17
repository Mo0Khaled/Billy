import 'package:billy/features/person/presentation/logic/person_cubit.dart';
import 'package:billy/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class AddPersonButton extends StatefulWidget {
  const AddPersonButton({Key? key}) : super(key: key);

  @override
  State<AddPersonButton> createState() => _AddPersonButtonState();
}

class _AddPersonButtonState extends State<AddPersonButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonCubit, PersonState>(
      listener: (context, state) {
        if(state is PersonAddedSuccessfully){
          _animationController.forward();
        }
      },
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          final personCubit = InjectionContainer.locator<PersonCubit>();
          personCubit.validate();

        },
        child: Lottie.asset('assets/animation/add.json',
            controller: _animationController,
            alignment: Alignment.center,
            onLoaded: (_) {}),
      ),
    );
  }
}
