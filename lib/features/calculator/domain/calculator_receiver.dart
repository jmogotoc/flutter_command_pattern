import 'package:flutter_command_pattern/core/receiver.dart';

class CalculatorReceiver extends Receiver {
  int _result = 0;

  @override
  void add(int value) => _result += value;
  @override
  void subtract(int value) => _result -= value;
  @override
  void multiply(int value) => _result *= value;
  @override
  void divide(int value) => _result ~/= value;

  @override
  int get result => _result;
}
