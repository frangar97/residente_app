import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/constants.dart';
import "package:residente_app/dependency_injection/injection_container.dart"
    as di;
import 'package:residente_app/presentation/router.dart';
import 'package:residente_app/state_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: kAppTitle,
          initialRoute: "auth_login",
          routes: getAplicationRoutes()),
    );
  }
}
