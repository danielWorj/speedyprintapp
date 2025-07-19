import 'package:flutter/material.dart';

import '../../color/color.dart';

class InputField extends StatelessWidget {
  final String hintTxt;
  final IconData icon;
  final TextEditingController controller;

  const InputField(
      {super.key,
      required this.hintTxt,
      required this.icon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width - 9,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(color: black),
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintTxt, icon: Icon(icon), border: InputBorder.none),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Information Requise";
            }
            return null;
          },
        ),
      ),
    );
  }
}
