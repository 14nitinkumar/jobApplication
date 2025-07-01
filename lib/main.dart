import 'package:flutter/material.dart';
import 'package:task_application/SCREENS/location_screen.dart';
import 'package:task_application/SCREENS/main_screen.dart';
import 'package:task_application/SCREENS/otp_screen.dart';
import 'package:task_application/SCREENS/splash_screen.dart';
import 'package:task_application/SCREENS/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen() 
      // LocationScreen()
      // OTPScreen()
      // WelcomeScreen()
      // Splash_Screen() 
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

