import 'package:flutter_command_pattern/core/command.dart';

class MultiplyCommand extends Command {
  MultiplyCommand(super.receiver, this._value);

  final int _value;

  @override
  void execute() {
    receiver.multiply(_value);
  }
  
  @override
  void undo() {
    receiver.divide(_value);
  }
}
