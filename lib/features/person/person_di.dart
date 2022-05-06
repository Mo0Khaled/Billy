import 'package:billy/core/constant/locale_db_keys.dart';
import 'package:billy/features/person/data/data_sources/person_locale_data_source.dart';
import 'package:billy/features/person/data/data_sources/person_locale_data_source_impl.dart';
import 'package:billy/features/person/data/repositories/person_repository_impl.dart';
import 'package:billy/features/person/domain/repositories/person_repository.dart';
import 'package:billy/features/person/domain/use_cases/create_person_use_case.dart';
import 'package:billy/features/person/domain/use_cases/get_persons_use_case.dart';
import 'package:billy/features/person/presentation/logic/person_cubit.dart';
import 'package:billy/injection_container.dart';
import 'package:hive/hive.dart';

Future<void> personDi() async {
  final sl = InjectionContainer.locator;

  // Register services here
  sl.registerFactory(
    () => PersonCubit(
      createPersonUseCase: sl(),
      getPersonsUseCase: sl(),
    ),
  );
  //use cases
  sl.registerLazySingleton(
    () => CreatePersonUseCase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
        () => GetPersonsUseCase(
      repository: sl(),
    ),
  );
  // repositories
  sl.registerLazySingleton<PersonRepository>(
    () => PersonRepositoryImpl(
      localeDataSource: sl(),
    ),
  );
  //! DataSources
  sl.registerLazySingleton<PersonLocaleDataSource>(
    () => PersonLocaleDataSourceImpl(
      hiveBox: sl(),
    ),
  );
  //! Core

  //! External
  final hiveBox = await Hive.openBox(LocaleBoxesDbKeys.personBoxKey);
  sl.registerLazySingleton<Box>(() => hiveBox);
}
