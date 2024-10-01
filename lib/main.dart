import 'package:flutter/material.dart';
import 'package:vidis/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vidis',
      theme: ThemeData.dark().copyWith(

       //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       // scaffoldBackgroundColor: Colors.blue,
      ),
      routes: {
        '/login': (context) => LoginScreen(),
      },
      home: LoginScreen(),
    );
  }
}
