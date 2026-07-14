import 'package:flutter/material.dart';
import 'package:flutter_command_pattern/ui/widgets/calculator_widget.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

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
                    height: constraints.maxHeight * 0.5,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.5,
                    child: CalculatorWidget(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
