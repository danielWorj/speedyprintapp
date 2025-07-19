import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback press;
  final Color backgroundColor;
  final Color? labelColor;

  const Button(
      {super.key,
      required this.label,
      required this.press,
      required this.backgroundColor,
      this.labelColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width - .9,
      height: 55,
      decoration: BoxDecoration(
          color: backgroundColor, // parametre :color send
          borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: press, //parametre
        child: Text(
          label, //paramètre
          style: labelColor == null
              ? const TextStyle(color: Colors.white)
              : TextStyle(color: labelColor),
        ),
      ),
    );
  }
}
