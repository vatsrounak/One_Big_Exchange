import 'package:flutter/material.dart';
import '../theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 70,
                )),
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Account Information'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text('Payment Methods'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              title: const Text(
                'Log Out',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}