import 'package:flutter/material.dart';

import 'result_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  String selectedGender = 'Male';

  double height = 175;
  int weight = 70;
  int age = 24;

  void calculateBmi() {
    final heightInMeters = height / 100;
    final bmi = weight / (heightInMeters * heightInMeters);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(bmi: bmi),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8f8f5),
      appBar: AppBar(
        title: const Text(
          'BMI 3D',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff12345b),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 18 : 40,
              vertical: 20,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  children: [
                    const Text(
                      'Know your healthy range',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(
                          child: _genderCard(
                            title: 'Male',
                            icon: Icons.male_rounded,
                            color: const Color(0xff10bfa5),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _genderCard(
                            title: 'Female',
                            icon: Icons.female_rounded,
                            color: const Color(0xffff746b),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    _heightCard(),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        Expanded(
                          child: _counterCard(
                            title: 'Weight',
                            value: '$weight kg',
                            icon: Icons.monitor_weight_outlined,
                            onMinus: () {
                              if (weight > 20) {
                                setState(() => weight--);
                              }
                            },
                            onPlus: () {
                              if (weight < 250) {
                                setState(() => weight++);
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _counterCard(
                            title: 'Age',
                            value: '$age',
                            icon: Icons.cake_outlined,
                            onMinus: () {
                              if (age > 5) {
                                setState(() => age--);
                              }
                            },
                            onPlus: () {
                              if (age < 120) {
                                setState(() => age++);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: FilledButton.icon(
                        onPressed: calculateBmi,
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xff10bfa5),
                          elevation: 10,
                          shadowColor: const Color(0xff10bfa5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        icon: const Icon(
                          Icons.calculate_rounded,
                          size: 27,
                        ),
                        label: const Text(
                          'Calculate BMI',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _genderCard({
    required String title,
    required IconData icon,
    required Color color,
  }) {
    final isSelected = selectedGender == title;

    return GestureDetector(
      onTap: () {
        setState(() => selectedGender = title);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          color: const Color(0xffe8f8f5),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              offset: Offset(-6, -6),
              blurRadius: 12,
            ),
            BoxShadow(
              color: Color(0x353a8379),
              offset: Offset(6, 6),
              blurRadius: 12,
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 48,
              color: isSelected ? color : Colors.black38,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? const Color(0xff12345b)
                    : Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _heightCard() {
    return _card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(
                  Icons.height_rounded,
                  color: Color(0xff10bfa5),
                ),
                SizedBox(width: 8),
                Text(
                  'Height',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff12345b),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: height.toInt().toString(),
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff12345b),
                    ),
                  ),
                  const TextSpan(
                    text: ' cm',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Slider(
              value: height,
              min: 120,
              max: 220,
              divisions: 100,
              activeColor: const Color(0xff10bfa5),
              inactiveColor: const Color(0xffbddbd6),
              onChanged: (value) {
                setState(() => height = value);
              },
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('120 cm'),
                Text('220 cm'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _counterCard({
    required String title,
    required String value,
    required IconData icon,
    required VoidCallback onMinus,
    required VoidCallback onPlus,
  }) {
    return _card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 20,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
              color: const Color(0xff10bfa5),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xff12345b),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xff12345b),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _circleButton(
                  icon: Icons.remove_rounded,
                  onPressed: onMinus,
                ),
                _circleButton(
                  icon: Icons.add_rounded,
                  onPressed: onPlus,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return IconButton.filled(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: const Color(0xffd3f2ec),
        foregroundColor: const Color(0xff087b6a),
      ),
      icon: Icon(icon),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffe8f8f5),
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-6, -6),
            blurRadius: 12,
          ),
          BoxShadow(
            color: Color(0x353a8379),
            offset: Offset(6, 6),
            blurRadius: 12,
          ),
        ],
      ),
      child: child,
    );
  }
}