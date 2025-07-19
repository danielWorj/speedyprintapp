import 'package:flutter/material.dart';

class ImageTemplate extends StatelessWidget {
  final String image ;
  final VoidCallback press ;
  const ImageTemplate({super.key,required this.image,required this.press});


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: press,
      child: Image.asset("assets/$image"),
    );
  }
}
