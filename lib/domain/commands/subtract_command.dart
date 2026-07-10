import 'package:flutter_command_pattern/core/command.dart';

class SubtractCommand extends Command {
  SubtractCommand(super.receiver, this._value);

  final int _value;


  @override
  void execute() {
    receiver.subtract(_value);
  }
  
  @override
  void undo() {
    receiver.add(_value);
  }
}
