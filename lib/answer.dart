import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback onClick;
  final String answerText;
  Answer(this.onClick, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(answerText),
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          onPrimary: Colors.black,
        ),
      ),
      width: double.infinity,
    );
  }
}
