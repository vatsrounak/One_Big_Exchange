import 'package:flutter/material.dart';
import 'package:one_big_exchange/routes.dart';
import 'package:one_big_exchange/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First Application',
      theme: myTheme,
      initialRoute: '/welcome',
      routes: routes,
    );
  }
}