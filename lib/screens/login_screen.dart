import 'package:flutter/material.dart';
import 'package:vidis/widgets/custom_button.dart';
import 'package:vidis/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Start or join the meeting', style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 38),
                child: Image.asset('assets/images/onboarding.jpg'),
              ),
              CustomButton(text: 'Login', onTap: () {  },),

          ],
        ),
      ),

    );
  }
}
