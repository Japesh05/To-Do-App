import 'package:flutter/material.dart';

class buttons extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
  buttons({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Text(
        text,
      ),
    );
  }
}
