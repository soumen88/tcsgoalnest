import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/routing/app_router.dart';
import 'package:tcsgoalnest/core/utils/firebase_remote_config_service.dart';

import 'core/repository/app_links_handler.dart';
import 'core/utils/default_firebase_options.dart';

void main() async{
  await init();
  runApp(MyApp());
}

Future<void> init() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isIOS){
    await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.devConfig
      /*options: FirebaseOptions(
          apiKey: "AIzaSyBEWMwWJpGYIoyOg-xUdpw4Atqpo7dtn78",
          appId: "1:805104212172:android:3d32da279325a68f0aca69",
          messagingSenderId: "805104212172",
          projectId: "goalnest-fe00a"
      )*/
    );
  }
  else{
    await Firebase.initializeApp(
    name: 'goal-nest',
    options: DefaultFirebaseOptions.devConfig,
  );
  }

  await FirebaseRemoteConfigService().initialize();
  await configureDependencies();
}

class MyApp extends StatelessWidget{
  /*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text("ios app running"),
    );
  }*/
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: ThemeData(
        primaryColor: ColorConstants.kWhiteColor
      ),
      builder: (BuildContext context, Widget? child){
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AppLinksHandler.init(context);
        });
        return child!;
      },
    );
  }

}