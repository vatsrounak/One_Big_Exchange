import 'package:flutter/material.dart';
import '../theme.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/images/cover.jpeg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Overlay
          Container(
            color: Colors.black.withOpacity(0.6), // Dark overlay
          ),
          // Content on top of the background
          Column(
            children: [
              const SizedBox(height: 70,),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Heading Text
                    const Text(
                      "Welcome to",
                      style: TextStyle(
                        fontFamily: 'Playfair',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      " OneBigExchange",
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        color: myTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              // Button (moved higher)
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: myTheme.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: myTheme.primaryColorDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already a Member?',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, "/login");
                    },
                    child: Text(
                      'Login now',
                      style: TextStyle(
                        color: myTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70,)
            ],
          ),
        ],
      ),
    );
  }
}
