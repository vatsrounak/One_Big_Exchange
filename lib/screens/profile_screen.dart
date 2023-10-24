import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    getUsername(); // Call a function to retrieve and set the username
  }

  Future<void> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username');
    if (savedUsername != null) {
      setState(() {
        username = savedUsername;
      });
    }
  }

  String username = '';

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
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: myTheme.primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    color: myTheme.primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10 ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          username,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Oswald',
                            color: myTheme.primaryColorDark,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Balance',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: myTheme.primaryColorDark,
                          ),
                        ),
                        Text(
                          '\$1,234.56', // Replace with the user's actual balance
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.bold,
                            color: myTheme.primaryColorDark,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              color: Colors.white,
                              elevation: 0,
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.add_circle),
                                    SizedBox(height: 10,),
                                    Text("Deposit"),
                                  ],
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {},
                              color: Colors.white,
                              elevation: 0,
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.monetization_on),
                                    SizedBox(height: 10,),
                                    Text("Withdraw"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
