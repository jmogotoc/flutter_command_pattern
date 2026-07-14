import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorNumberButton extends StatelessWidget {
  final double width;
  final double height;
  final String value;
  const CalculatorNumberButton({
    super.key,
    required this.value,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final double fontSize = min(width, height) * 0.4;
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(2.0),
        child: Material(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(18),
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () {},
            child: Center(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
