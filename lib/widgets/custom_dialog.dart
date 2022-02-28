import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  String text;

  CustomDialog(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Text(
          text,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
