import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../theme.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  ForgetPasswordScreenState createState() => ForgetPasswordScreenState();
}

class ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();

  Future<void> forgetPassword() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    );

    try {
      // Make an HTTP POST request to the password reset API
      final response = await http.post(
        Uri.parse('http://localhost:8000/api/password_reset/'), // Replace with your API URL
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': emailController.text,
        }),
      );

      Navigator.pop(context);

      if (response.statusCode == 200) {
        // Password reset email sent successfully
        showSuccessModal();
      } else {
        showErrorDialog('Failed to send Reset Email');
      }
    } catch (e) {
      Navigator.pop(context);
      showErrorDialog('Failed to send Reset Email : $e');
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Center(
            child: Text(
              'Error',
              style: TextStyle(color: Colors.white),
            ),
          ),
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void showSuccessModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 60,
                ),
              ),
              const Text(
                "Email sent successfully!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "A password reset instruction has been sent to your email.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: myTheme.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      "Login",
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
              const SizedBox(height: 60),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset("assets/images/logo.png", height: 100, width: 280),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Forget Password!",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Enter your registered email below to receive password reset instruction.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: forgetPassword,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: myTheme.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      "Send",
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
            ],
          ),
        ),
      ),
    );
  }
}
