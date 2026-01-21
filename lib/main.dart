import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/routing/app_router.dart';

void main() async{
  await init();
  runApp(MyApp());
}

Future<void> init() async{
  WidgetsFlutterBinding.ensureInitialized();
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