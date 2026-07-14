import 'package:flutter/material.dart';
import 'package:flutter_command_pattern/ui/widgets/calculator_command_button.dart';
import 'package:flutter_command_pattern/ui/widgets/calculator_number_button.dart';

class CalculatorWidget extends StatelessWidget {
  const CalculatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> options = ['+', '-', '*', '/', '='];
    final List<String> numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.8,
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: List.generate(
                  numbers.length,
                  (index) => CalculatorNumberButton(
                    value: numbers[index],
                    width: constraints.maxWidth * (0.8 / 3),
                    height: constraints.maxHeight / 4,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: constraints.maxWidth * 0.2,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(
                  options.length,
                  (index) => CalculatorCommandButton(
                    value: options[index],
                    width: constraints.maxWidth * 0.2,
                    height: constraints.maxHeight / options.length,
                  ),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
