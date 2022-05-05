import 'package:billy/features/person/person_di.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
class InjectionContainer {

 static GetIt locator = GetIt.instance;

 InjectionContainer._();
}
Future<void> setupLocator()async {
  // Register services here
  personDi();
}
