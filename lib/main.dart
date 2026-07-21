import 'package:flutter/material.dart';
import 'package:flutter_command_pattern/features/calculator/presentation/pages/calculator_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorPage()
    );
  }
}