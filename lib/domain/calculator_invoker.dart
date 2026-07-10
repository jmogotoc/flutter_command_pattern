import 'package:flutter_command_pattern/core/command.dart';
import 'package:flutter_command_pattern/core/invoker.dart';

class CalculatorInvoker extends Invoker {
  CalculatorInvoker(super.receiver);

  final List<Command> _history = [];

  @override
  void execute(Command command) {
    command.execute();
    _history.add(command);
  }

  @override
  void undo() {
    if (_history.isNotEmpty) {
      final lastCommand = _history.removeLast();
      lastCommand.undo();
    }
  }
}