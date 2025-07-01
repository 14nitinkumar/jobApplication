import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_application/SCREENS/home_signup_screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_Screen();
}

class _Splash_Screen extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeSignUpScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
                child: Image.asset(
                  'assets/images/logo.png',
                  // width: 200,
                ),
              ),
            ),
            // SizedBox(
            //   height: 300,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 160, 0, 0),
              child: Text(
                'Powered by Oyelabs',
                style: TextStyle(
                    // color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'WITH LOVE ',
              style: TextStyle(
                  color: const Color.fromARGB(255, 113, 168, 196),
                  // fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
