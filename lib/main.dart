import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/routing/app_router.dart';
import 'package:tcsgoalnest/ui/screens/display_common_widgets_screen.dart';
import 'package:tcsgoalnest/ui/screens/key_value_store_screen.dart';
import 'package:tcsgoalnest/ui/screens/splash_screen.dart';
import 'package:tcsgoalnest/ui/screens/stream_example_screen.dart';

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