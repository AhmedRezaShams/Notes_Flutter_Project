import 'package:flutter/material.dart';
import 'package:notes/views/index.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double borderRadius;
  final TextStyle? textStyle;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.indigoAccent,
    this.borderRadius = 8.0,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ??
            const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
      ),
    );
  }
}
