import 'package:bmi_kalkulator_app/calculator.dart';
import 'package:flutter/material.dart';

// Halaman hasil: menampilkan BMR dan tabel kebutuhan kalori
class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.calc});

  final Calculator calc; // data dari halaman input

  @override
  Widget build(BuildContext context) {
    final bmr = calc.calculateBMR().round();
    final needs = calc.dailyCalories();

    return Scaffold(
      appBar: AppBar(title: const Text('BMR CALCULATOR')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const Text(
                    'Your Result',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  // Kartu BMR utama
                  Card(
                    color: const Color(0xFF1D1E33),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          const Text('BMR', style: TextStyle(fontSize: 20)),
                          Text(
                            '$bmr',
                            style: const TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Calories/day'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Daily calorie needs based on activity level',
                    style: TextStyle(fontSize: 18),
                  ),
                  // Satu baris untuk setiap level aktivitas
                  ...needs.entries.map(
                    (e) => Card(
                      color: const Color(0xFF1D1E33),
                      child: ListTile(
                        title: Text(e.key),
                        trailing: Text(
                          '${e.value}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Tombol kembali ke halaman input
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                color: const Color(0xFFEB1555),
                width: double.infinity,
                height: 80,
                alignment: Alignment.center,
                child: const Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
