// input_page.dart

import 'package:bmi_kalkulator_app/calculator.dart';
import 'package:bmi_kalkulator_app/components/bottom_button.dart';
import 'package:bmi_kalkulator_app/components/custom_card.dart';
import 'package:bmi_kalkulator_app/components/icon_card.dart';
import 'package:bmi_kalkulator_app/components/round_icon_button.dart';
import 'package:bmi_kalkulator_app/constants.dart';
import 'package:bmi_kalkulator_app/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 160;
  int weight = 60;
  int age = 25;
  // int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMR CALCULATOR')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.mars.data,
                      caption: 'MALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.venus.data,
                      caption: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: labelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: numberTextStyle),
                      const Text('cm', style: labelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: labelTextStyle),
                        Text(weight.toString(), style: numberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus.data,
                              onPressed: () {
                                setState(() {
                                  if (weight >= 30) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus.data,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Kartu AGE (hasil copy dari kartu WEIGHT)
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE', style: labelTextStyle),
                        Text(age.toString(), style: numberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus.data,
                              onPressed: () {
                                setState(() {
                                  if (age > 15) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus.data,
                              onPressed: () {
                                setState(() {
                                  if (age < 80) {
                                    age++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              // 1. Buat objek kalkulator dari input pengguna
              Calculator cal = Calculator(
                height: height,
                weight: weight,
                age: age,
                gender: selectedGender,
              );
              // 2. Pindah ke halaman hasil sambil membawa objek kalkulator
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultPage(calc: cal)),
              );
            },
          ),
        ],
      ),
    );
  }
}
