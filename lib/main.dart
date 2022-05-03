import 'package:billy/core/theme/app_theme.dart';
import 'package:billy/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  final getAppDir = await getApplicationSupportDirectory();
  await Hive.initFlutter(getAppDir.path);
  runApp(const Billy());
}

class Billy extends StatelessWidget {
  const Billy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Billy',
      theme: AppTheme.lightTheme,
      // home:
    );
  }
}
