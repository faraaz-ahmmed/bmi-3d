import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;

  const ResultScreen({
    super.key,
    required this.bmi,
  });

  String get category {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  String get message {
    if (bmi < 18.5) {
      return 'Your weight is below the healthy range.';
    }

    if (bmi < 25) {
      return 'Your BMI is in a healthy range.';
    }

    if (bmi < 30) {
      return 'Your weight is above the healthy range.';
    }

    return 'Consider improving your daily health routine.';
  }

  Color get resultColor {
    if (bmi < 18.5) return Colors.orange;
    if (bmi < 25) return const Color(0xff16b979);
    if (bmi < 30) return Colors.deepOrange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8f8f5),
      appBar: AppBar(
        title: const Text(
          'BMI Result',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xffe8f8f5),
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-8, -8),
                    blurRadius: 16,
                  ),
                  BoxShadow(
                    color: Color(0x403a8379),
                    offset: Offset(8, 8),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.favorite_rounded,
                    size: 75,
                    color: resultColor,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 65,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff12345b),
                    ),
                  ),
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: resultColor,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: FilledButton.icon(
                      onPressed: () => Navigator.pop(context),
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xff10bfa5),
                      ),
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text(
                        'Calculate Again',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'BMI is a general health guide, not a medical diagnosis.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}