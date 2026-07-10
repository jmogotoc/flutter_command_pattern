import 'package:flutter_command_pattern/core/receiver.dart';

abstract class Command {
  final Receiver receiver;

  Command(this.receiver);
  void execute();
  void undo();
}