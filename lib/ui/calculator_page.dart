import 'package:flutter/material.dart';
import 'package:flutter_command_pattern/core/types/number_button_enum.dart';
import 'package:flutter_command_pattern/core/types/option_button_enum.dart';
import 'package:flutter_command_pattern/domain/calculator_invoker.dart';
import 'package:flutter_command_pattern/domain/calculator_receiver.dart';
import 'package:flutter_command_pattern/domain/commands/addition_command.dart';
import 'package:flutter_command_pattern/domain/commands/divide_command.dart';
import 'package:flutter_command_pattern/domain/commands/multiply_command.dart';
import 'package:flutter_command_pattern/domain/commands/subtract_command.dart';
import 'package:flutter_command_pattern/ui/widgets/calculator_screen_widget.dart';
import 'package:flutter_command_pattern/ui/widgets/calculator_widget.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late final CalculatorReceiver _calculatorReceiver;
  late final CalculatorInvoker _calculatorInvoker;

  List<(OptionButtonEnum?, NumberButtonEnum?)> history = [];
  int counterTuple = 0;
  int limitTuple = 4;

  @override
  void initState() {
    _calculatorReceiver = CalculatorReceiver();
    _calculatorInvoker = CalculatorInvoker(_calculatorReceiver);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    height: constraints.maxHeight * 0.5,
                    child: CalculatorScreenWidget(
                      result: _calculatorReceiver.result,
                      history: history,
                      onClear: () {
                        resetHistory();
                        resetCalculator();
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: constraints.maxHeight * 0.5,
                    child: CalculatorWidget(
                      onNumberTap: (NumberButtonEnum number) {
                        if (history.isEmpty) {
                          history.add((null, number));
                          _calculatorInvoker.execute(
                            MultiplyCommand(_calculatorReceiver, 0),
                          );
                        } else {
                          history[counterTuple] = (
                            history[counterTuple].$1,
                            number,
                          );
                        }

                        counterTuple++;
                        setState(() {});
                      },
                      onOptionTap: (OptionButtonEnum option) {
                        history.add((option, null));

                        if (option == OptionButtonEnum.equals) {
                          calculeTotal();
                        }

                        setState(() {});
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void calculeTotal() {
    for (var tuple in history) {
      final option = tuple.$1;
      final number = tuple.$2;

      if (number != null) {
        switch (option) {
          case OptionButtonEnum.addition:
            _calculatorInvoker.execute(
              AdditionCommand(_calculatorReceiver, number.value),
            );
            break;
          case OptionButtonEnum.subtraction:
            _calculatorInvoker.execute(
              SubtractCommand(_calculatorReceiver, number.value),
            );
            break;
          case OptionButtonEnum.multiplication:
            _calculatorInvoker.execute(
              MultiplyCommand(_calculatorReceiver, number.value),
            );
            break;
          case OptionButtonEnum.division:
            _calculatorInvoker.execute(
              DivideCommand(_calculatorReceiver, number.value),
            );
            break;
          case OptionButtonEnum.equals:
            // Do nothing for equals
            break;
          default:
            _calculatorInvoker.execute(
              AdditionCommand(_calculatorReceiver, number.value),
            );
            break;
        }
      }
    }

    resetHistory();
  }

  void resetHistory() {
    history.clear();
    counterTuple = 0;
  }

  void resetCalculator() {
    _calculatorInvoker.execute(MultiplyCommand(_calculatorReceiver, 0));
  }
}
