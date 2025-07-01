import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio_application/portfolio_pa.dart';

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
          context, MaterialPageRoute(builder: (context) => Portfollio_1()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            'PORTFOLIO',
            style: TextStyle(
                color: Colors.orange,
                fontSize: 50,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
