import 'package:flutter/material.dart';
import 'package:one_big_exchange/screens/about_screen.dart';
import 'package:one_big_exchange/screens/auth/forget_password_screen.dart';
import 'package:one_big_exchange/screens/auth/login_screen.dart';
import 'package:one_big_exchange/screens/auth/register_screen.dart';
import 'package:one_big_exchange/screens/profile_screen.dart';
import 'package:one_big_exchange/screens/welcome_screen.dart';
import 'package:one_big_exchange/widgets/scaffold_with_bottom_nav.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const ScaffoldWithBottomNav(),
  '/about': (BuildContext context) => const AboutScreen(),
  '/welcome': (BuildContext context) => const WelcomePage(),
  '/login': (BuildContext context) => const LoginPage(),
  '/register': (BuildContext context) => const RegisterPage(),
  '/forget-password': (BuildContext context) => const ForgetPasswordScreen(),
  '/profile': (BuildContext context) => const ProfileScreen(),
};