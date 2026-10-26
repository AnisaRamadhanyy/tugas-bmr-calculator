import 'package:bmi_kalkulator_app/constants.dart';

// Class ini berisi logika perhitungan BMR (tanpa tampilan)
class Calculator {
  Calculator({
    required this.height, // tinggi (cm)
    required this.weight, // berat (kg)
    required this.age, // umur (tahun)
    required this.gender, // Gender.male atau Gender.female
  });

  final int height;
  final int weight;
  final int age;
  final Gender gender;

  // Faktor pengali kalori berdasarkan tingkat aktivitas
  static const Map<String, double> activityFactors = {
    'Sedentary: little or no exercise': 1.2,
    'Exercise 1-3 times/week': 1.375,
    'Exercise 4-5 times/week': 1.465,
    'Daily exercise or intense exercise 3-4 times/week': 1.55,
    'Intense exercise 6-7 times/week': 1.725,
    'Very intense exercise daily, or physical job': 1.9,
  };

  // Rumus Mifflin-St Jeor
  double calculateBMR() {
    double bmr = 10 * weight + 6.25 * height - 5 * age;
    // Pria ditambah 5, wanita dikurangi 161
    return gender == Gender.male ? bmr + 5 : bmr - 161;
  }

  // Kebutuhan kalori harian = BMR x faktor aktivitas
  Map<String, int> dailyCalories() {
    final bmr = calculateBMR();
    return activityFactors.map((k, v) => MapEntry(k, (bmr * v).round()));
  }
}
