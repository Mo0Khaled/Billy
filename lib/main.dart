import 'package:billy/core/constant/bloc_observer.dart';
import 'package:billy/core/constant/locale_db_keys.dart';
import 'package:billy/core/theme/app_theme.dart';
import 'package:billy/features/person/data/models/person_model.dart';
import 'package:billy/features/person/presentation/logic/person_cubit.dart';
import 'package:billy/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final getAppDir = await getApplicationSupportDirectory();
  await Hive.initFlutter(getAppDir.path);
  await setupLocator();
  BlocOverrides.runZoned(
    () => runApp(
      const Billy(),
    ),
    blocObserver: MyBlocObserver(),
  );
}

class Billy extends StatelessWidget {
  const Billy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Billy',
      theme: AppTheme.lightTheme,
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InjectionContainer.locator<PersonCubit>()..getPersons(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Billy'),
          leading: IconButton(
              onPressed: () {
                final cubit = InjectionContainer.locator<PersonCubit>();

                final personModel =
                    PersonModel(id: 'null', name: 'mo', phone: "344");
                cubit.createPerson(personModel: personModel);
              },
              icon: Icon(Icons.eighteen_mp)),
        ),
        body: BlocBuilder<PersonCubit, PersonState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<PersonCubit>(context);
            return ListView.builder(
              itemCount: cubit.persons.length,
              itemBuilder: (context, index) => Column(
                children: [
                  if(index == 0)GestureDetector(onTap: (){

                    final personModel =
                    PersonModel(id: 'null', name: 'mo', phone: "344");
                    cubit.createPerson(personModel: personModel);
                  },child: Text("state.toString()")),
                  GestureDetector(
                    onTap: () {
                      cubit.deletePerson(cubit.persons[index].id!);
                    },
                    child: Text(
                      cubit.persons[index].name,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
