import 'package:flutter/material.dart';
import 'core/routers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final page = Pages();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: page.initial,
      routes: page.routes,
    );
  }
}
