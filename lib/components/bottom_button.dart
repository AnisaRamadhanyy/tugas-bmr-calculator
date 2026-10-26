// bottom_button.dart

import 'package:bmi_kalkulator_app/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonTitle, required this.onTap});

  final String buttonTitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        // width: double.infinity,
        height: bottomContainerHeight,
        color: bottomContainerColor,
        child: Center(child: Text(buttonTitle, style: buttonTextStyle)),
      ),
    );
  }
}
