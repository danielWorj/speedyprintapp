import 'package:flutter/material.dart';

class CardRedirect extends StatelessWidget {
  final String title;
  final Icon icon;
  final VoidCallback press;
  const CardRedirect(
      {super.key,
      required this.title,
      required this.icon,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        color: Colors.white70,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: icon,
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
