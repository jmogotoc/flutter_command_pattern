import 'package:flutter_command_pattern/core/command.dart';

class DivideCommand extends Command {
  DivideCommand(super.receiver, this._value);

  final int _value;

  @override
  void execute() {
    receiver.divide(_value);
  }
  
  @override
  void undo() {
    receiver.multiply(_value);
  }
}
