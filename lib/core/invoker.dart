import 'package:flutter_command_pattern/core/command.dart';
import 'package:flutter_command_pattern/core/receiver.dart';

abstract class Invoker {
  final Receiver receiver;
  Invoker(this.receiver);
  void execute(Command command);
  void undo();
}
