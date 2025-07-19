import 'package:flutter/material.dart';

class TextIconWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const TextIconWidget({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 8,
        ),
        Text(text),
      ],
    );
  }
}
