import 'package:flutter/material.dart';

import '../styles.dart';

class NumberButton extends StatefulWidget {
  final String char;
  final Function(String) callback;
  final Color Function(String) accentedOperatorColor;

  const NumberButton(
      {Key? key,
      required this.char,
      required this.callback,
      required this.accentedOperatorColor})
      : super(key: key);

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  @override
  Widget build(BuildContext context) {
    Color thisColor = widget.accentedOperatorColor(widget.char);
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: thisColor),
        child: Text(widget.char, style: buttonTextStyle));
  }

  void onPressed() {
    widget.callback(widget.char);
  }
}
