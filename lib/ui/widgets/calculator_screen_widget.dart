import 'package:flutter/material.dart';
import 'package:flutter_command_pattern/core/types/number_button_enum.dart';
import 'package:flutter_command_pattern/core/types/option_button_enum.dart';

class CalculatorScreenWidget extends StatelessWidget {
  final int result;
  final List<(OptionButtonEnum?, NumberButtonEnum?)> history;
  final VoidCallback onClear;
  const CalculatorScreenWidget({
    super.key,
    required this.result,
    required this.history,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            IconButton(onPressed: onClear, icon: Icon(Icons.cleaning_services)),
          ],
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: history.map((tuple) {
            final option = tuple.$1;
            final number = tuple.$2;

            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (option != null)
                  Text(
                    '${option.label} ',
                    style: const TextStyle(color: Colors.black, fontSize: 32),
                  ),
                if (number != null)
                  Text(
                    '${number.value} ',
                    style: const TextStyle(color: Colors.black, fontSize: 32),
                  ),
              ],
            );
          }).toList(),
        ),
        Divider(),
        Text(
          result.toString(),
          style: const TextStyle(color: Colors.black, fontSize: 32),
        ),
      ],
    );
  }
}
