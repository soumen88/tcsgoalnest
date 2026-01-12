import 'package:flutter/material.dart';
import 'package:tcsgoalnest/ui/screens/key_value_store_screen.dart';
import 'package:tcsgoalnest/ui/screens/stream_example_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KeyValueStoreScreen(),
    );
  }

}