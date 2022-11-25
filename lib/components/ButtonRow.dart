import 'package:flutter/widgets.dart';

import 'NumberButton.dart';

class ButtonRow extends StatelessWidget {
  final List symbolsRow;
  final Function(String) callback;
  final Color Function(String) accentedOperatorColor;

  const ButtonRow(
      {Key? key,
      required this.symbolsRow,
      required this.callback,
      required this.accentedOperatorColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: symbolsRow
          .map((char) => NumberButton(
              char: char,
              callback: callback,
              accentedOperatorColor: accentedOperatorColor))
          .toList(),
    );
  }
}
