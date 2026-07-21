import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_command_pattern/core/types/number_button_enum.dart';

class CalculatorNumberButton extends StatelessWidget {
  final double width;
  final double height;
  final NumberButtonEnum number;
  final void Function(NumberButtonEnum) onTap;
  const CalculatorNumberButton({
    super.key,
    required this.number,
    required this.width,
    required this.height,
    required this.onTap,
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
            onTap: () => onTap.call(number),
            child: Center(
              child: Text(
                number.value.toString(),
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
