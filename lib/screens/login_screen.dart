import 'package:flutter/material.dart';
import 'package:vidis/resources/auth_methods.dart';
import 'package:vidis/screens/home_screen.dart';
import 'package:vidis/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Start or join the meeting',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 38),
              child: Image.asset('assets/images/onboarding.jpg'),
            ),
            const SizedBox(height: 30),

            // Centered Google Sign In Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity, // Make the button full-width
                child: ElevatedButton.icon(
                  onPressed: () async{
                    bool res = await _authMethods.signInWithGoogle(context);
                    if(res){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                          const HomeScreen())
                      );
                    }
                  },
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/google.png',
                      height: 30.0,
                    ),
                  ),
                  label: const Text(
                    'Google Sign In',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    backgroundColor: Colors.blueAccent, // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                    shadowColor: Colors.blue, // Shadow color
                    elevation: 8, // Shadow elevation for depth
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
