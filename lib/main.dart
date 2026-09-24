import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const BmiApp());
}

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI 3D',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff10bfa5),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}