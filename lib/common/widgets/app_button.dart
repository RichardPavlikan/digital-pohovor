import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({required this.onPressed, required this.text, super.key});

  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.blue,
          side: const BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        child: SizedBox(
          width: 150,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
