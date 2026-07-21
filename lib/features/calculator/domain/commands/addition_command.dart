import 'package:flutter_command_pattern/core/command.dart';

class AdditionCommand extends Command {
  AdditionCommand(super.receiver, this._value);

  final int _value;

  @override
  void execute() {
    receiver.add(_value);
  }
  
  @override
  void undo() {
    receiver.subtract(_value);
  }
}
