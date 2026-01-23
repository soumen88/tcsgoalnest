import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/routing/app_router.dart';
import 'package:tcsgoalnest/core/utils/firebase_remote_config_service.dart';

import 'core/utils/default_firebase_options.dart';

void main() async{
  await init();
  runApp(MyApp());
}

Future<void> init() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'goal-nest',
    options: DefaultFirebaseOptions.devConfig,
  );
  await FirebaseRemoteConfigService().initialize();
  await configureDependencies();
}

class MyApp extends StatelessWidget{
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (BuildContext context, Widget? child){
        return child!;
      },
    );
  }

}