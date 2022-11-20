import 'package:calculator_app/styles.dart';
import 'package:flutter/material.dart';

import 'number-button.dart';

class CalculatorLayout extends StatefulWidget {
  const CalculatorLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<CalculatorLayout> createState() => _CalculatorLayoutState();
}

class _CalculatorLayoutState extends State<CalculatorLayout> {
  final List numbersRow1 = ['7', '8', '9', '÷'];
  final List numbersRow2 = ['4', '5', '6', 'x'];
  final List numbersRow3 = ['1', '2', '3', '-'];
  final List numbersRow4 = ['0', '.', '=', '+'];
  final isNumber = RegExp(r'^\d+\.?\d*$', dotAll: true);

  String lastPressedOperator = '';
  String history = '';
  String display = '';
  List queue = [];

  Color accentedOperatorColor(String char) {
    if (RegExp(r'[+\-÷x=]').hasMatch(char) && char == lastPressedOperator) {
      //  set this color to accented
      return Theme.of(context).colorScheme.secondary;
    }

    return Theme.of(context).colorScheme.primary;
  }

  updateDisplay(data) {
    setState(() {
      if (RegExp(r'[+\-÷x=]').hasMatch(data)) {
        lastPressedOperator = data;
        if (display.isNotEmpty) {
          queue.add(num.parse(display));
        }
        if (data == '+') {
          // add
        } else if (data == '-') {
          // subtract
        } else if (data == 'x') {
          // multiply
        } else if (data == '÷') {
          // divide
        } else if (data == '=') {
          // show result
        }
      }
      if (queue.isNotEmpty && queue.last.toString() == display) {
        // if an operator is pressed, start a new number
        display = '';
      }
      if (isNumber.hasMatch(display + data)) {
        // if a number is pressed, show on main display
        display += data;
        return;
      }
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('LO: $lastPressedOperator'),
        Text('Q: $queue'),
        Text('H: $history'),
        Text(
          display,
          style: resultTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: numbersRow1
              .map((char) => NumberButton(
                  char: char,
                  callback: updateDisplay,
                  accentedOperatorColor: accentedOperatorColor))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: numbersRow2
              .map((char) => NumberButton(
                  char: char,
                  callback: updateDisplay,
                  accentedOperatorColor: accentedOperatorColor))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: numbersRow3
              .map((char) => NumberButton(
                  char: char,
                  callback: updateDisplay,
                  accentedOperatorColor: accentedOperatorColor))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: numbersRow4
              .map((char) => NumberButton(
                  char: char,
                  callback: updateDisplay,
                  accentedOperatorColor: accentedOperatorColor))
              .toList(),
        ),
      ],
    );
  }
}
