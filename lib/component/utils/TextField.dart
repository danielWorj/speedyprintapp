//Ici on va designer nos butons
import '../../color/color.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintTxt;
  final IconData icon;
  final TextEditingController controller;
  final bool passwordInvisble;

  const InputField(
      {super.key,
      required this.hintTxt,
      required this.icon,
      required this.controller,
      this.passwordInvisble = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: size.width - .9,
      height: 55,
      decoration: BoxDecoration(
          color: white, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextFormField(
          obscureText: passwordInvisble,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintTxt,
            icon: Icon(icon),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
