import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vidis/resources/auth_methods.dart';
import 'package:vidis/screens/home_screen.dart';
import 'package:vidis/screens/login_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // scaffoldBackgroundColor: Colors.blue,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
      },
      home: StreamBuilder(
          stream: AuthMethods().authChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Skeletonizer(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (snapshot.hasData) {
              return const HomeScreen();
            }
            return const LoginScreen();
          }),
    );
  }
}
