import 'package:flutter/material.dart';
import 'package:speedy/color/color.dart';
import 'package:text_area/text_area.dart';

class TextAreaCustom extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final Color color;
  final VoidCallback pressIcon;
  final reasonValidation = true;

  const TextAreaCustom(
      {super.key,
      required this.controller,
      required this.icon,
      required this.color,
      required this.pressIcon});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextArea(
          borderRadius: 10,
          textEditingController: controller,
          suffixIcon: icon,
          onSuffixIconPressed: pressIcon,
          borderColor: color,
          validation: reasonValidation,
        ),
      ),
    );
  }
}
