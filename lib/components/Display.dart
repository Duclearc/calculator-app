import 'package:flutter/widgets.dart';

class Display extends StatelessWidget {
  final String displayContent;
  final TextStyle textStyle;

  const Display(
      {Key? key, required this.displayContent, required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        displayContent,
        style: textStyle,
      ),
    );
  }
}
