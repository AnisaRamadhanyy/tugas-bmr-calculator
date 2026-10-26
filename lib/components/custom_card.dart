// custom_card.dart

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.color, this.cardChild, this.onPress});

  final Color color;
  final Widget? cardChild;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //untukmendeteksiadanyadetektor
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.only(left: 1.0, right: 1.0), //paddingartinyajarakdarikiriataukananobjeknaruhteksdicontainertekstersebutgabisanempeldikiri
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            10.0,
          ), //circulartukotaknyamembulat
        ),
        child: cardChild, //bisapakecustomcard
      ),
    );
  }
}
