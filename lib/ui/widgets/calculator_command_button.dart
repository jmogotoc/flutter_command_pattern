import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_command_pattern/core/types/option_button_enum.dart';

class CalculatorCommandButton extends StatelessWidget {
  final double width;
  final double height;
  final OptionButtonEnum option;
  final void Function(OptionButtonEnum) onTap;
  const CalculatorCommandButton({
    super.key,
    required this.option,
    required this.width,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double fontSize = min(width, height) * 0.5;
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
            onTap: () => onTap.call(option),
            child: Center(
              child: Text(
                option.label,
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
