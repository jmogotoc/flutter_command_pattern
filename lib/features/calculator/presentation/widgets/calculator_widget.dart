import 'package:flutter/material.dart';
import 'package:flutter_command_pattern/core/types/number_button_enum.dart';
import 'package:flutter_command_pattern/core/types/option_button_enum.dart';
import 'package:flutter_command_pattern/features/calculator/presentation/widgets/calculator_command_button.dart';
import 'package:flutter_command_pattern/features/calculator/presentation/widgets/calculator_number_button.dart';

class CalculatorWidget extends StatelessWidget {
  final void Function(NumberButtonEnum) onNumberTap;
  final void Function(OptionButtonEnum) onOptionTap;

  const CalculatorWidget({
    super.key,
    required this.onNumberTap,
    required this.onOptionTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<OptionButtonEnum> options = [
      OptionButtonEnum.addition,
      OptionButtonEnum.subtraction,
      OptionButtonEnum.multiplication,
      OptionButtonEnum.division,
      OptionButtonEnum.equals,
    ];
    final List<NumberButtonEnum> numbers = [
      NumberButtonEnum.one,
      NumberButtonEnum.two,
      NumberButtonEnum.three,
      NumberButtonEnum.four,
      NumberButtonEnum.five,
      NumberButtonEnum.six,
      NumberButtonEnum.seven,
      NumberButtonEnum.eight,
      NumberButtonEnum.nine,
      NumberButtonEnum.zero,
    ];
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
                    number: numbers[index],
                    width: constraints.maxWidth * (0.8 / 3),
                    height: constraints.maxHeight / 4,
                    onTap: (NumberButtonEnum number) =>
                        onNumberTap.call(number),
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
                    option: options[index],
                    width: constraints.maxWidth * 0.2,
                    height: constraints.maxHeight / options.length,
                    onTap: (OptionButtonEnum option) =>
                        onOptionTap.call(option),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
