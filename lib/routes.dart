import 'package:flutter/material.dart';
import 'package:one_big_exchange/screens/auth/login_screen.dart';
import 'package:one_big_exchange/screens/auth/register_screen.dart';
import 'package:one_big_exchange/screens/home_screen.dart';
import 'package:one_big_exchange/screens/profile_screen.dart';
import 'package:one_big_exchange/screens/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const HomeScreen(),
  '/welcome': (BuildContext context) => const WelcomePage(),
  '/login': (BuildContext context) => const LoginPage(),
  '/register': (BuildContext context) => const RegisterPage(),
  '/profile': (BuildContext context) => const ProfileScreen(),
};