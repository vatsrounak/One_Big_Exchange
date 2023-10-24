import 'package:flutter/material.dart';
import 'package:one_big_exchange/theme.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      color: myTheme.primaryColor,
      child: const Text(
        "Custom Button",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}