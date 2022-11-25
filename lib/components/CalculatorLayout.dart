import 'package:calculator_app/components/ButtonRow.dart';
import 'package:calculator_app/components/Display.dart';
import 'package:calculator_app/styles.dart';
import 'package:calculator_app/symbols.dart';
import 'package:flutter/material.dart';

import 'NumberButton.dart';

class CalculatorLayout extends StatefulWidget {
  const CalculatorLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<CalculatorLayout> createState() => _CalculatorLayoutState();
}

class _CalculatorLayoutState extends State<CalculatorLayout> {
  final List numbersRow0 = [delete, percentage, reset];
  final List numbersRow1 = ['7', '8', '9', division];
  final List numbersRow2 = ['4', '5', '6', multiplication];
  final List numbersRow3 = ['1', '2', '3', subtraction];
  final List numbersRow4 = ['0', comma, equals, addition];

  final isNumber = RegExp(r'^\d+\.?\d*$', dotAll: true);

  String lastPressedOperator = '';
  String history = '';
  String display = '';
  List queue = [];

  Color accentedOperatorColor(String char) {
    if (numbersRow0.contains(char)) {
      return Theme.of(context).colorScheme.errorContainer;
    }
    if (operators.contains(char) && char == lastPressedOperator) {
      //  set this color to accented
      return Theme.of(context).colorScheme.secondary;
    }

    return Theme.of(context).colorScheme.primary;
  }

  updateDisplay(char) {
    setState(() {
      if (numbersRow0.contains(char)) {
        display = display.substring(0, display.length - 1);
      }
      if (lastPressedOperator == '=') {
        history = '';
        queue = [];
      }
      if (RegExp(r'[+\-÷x=]').hasMatch(char)) {
        // if operator is pressed, save it as lastPressedOperator
        lastPressedOperator = char;
        if (display.isNotEmpty) {
          // add display contents to queue
          queue.add(num.parse(display));
          String lastPressedNumber = queue.last.toString();
          if (queue.isNotEmpty && lastPressedNumber == display) {
            // start a new number
            history += '$lastPressedNumber $lastPressedOperator ';
            if (char != '=') {
              display = '';
            }
          }
        }
        if (char == '+') {
          // add
        } else if (char == '-') {
          // subtract
        } else if (char == 'x') {
          // multiply
        } else if (char == '÷') {
          // divide
        } else if (char == '=') {
          // show result
        }
      }

      if (isNumber.hasMatch(display + char)) {
        // if a number is pressed, show on main display
        display += char;
        return;
      }
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    List allRows = [
      numbersRow0,
      numbersRow1,
      numbersRow2,
      numbersRow3,
      numbersRow4
    ];
    List displayContent = [
      history,
      display
    ]; // main display must ALWAYS come last!
    return Column(
      children: [
        Text('LO: $lastPressedOperator'),
        Text('Q: $queue'),
        ...displayContent.map((e) => Display(
              displayContent: e,
              textStyle:
                  e == displayContent.last ? resultTextStyle : historyTextStyle,
            )),
        ...allRows.map((row) => ButtonRow(
            symbolsRow: row,
            callback: updateDisplay,
            accentedOperatorColor: accentedOperatorColor))
      ],
    );
  }
}
