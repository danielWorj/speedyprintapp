import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String label;
  final VoidCallback press;
  final Icon icon;
  const CustomIconButton({super.key , required this.label , required this.press , required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      margin: const EdgeInsets.only(
        left: 18,
        right: 18,
        bottom: 32,
      ),
      child: ElevatedButton(
        onPressed: press,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              width: 16,
            ),
            Text(
              '${label}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
