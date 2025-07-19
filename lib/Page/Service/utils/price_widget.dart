import 'package:flutter/material.dart';

import '../../../color/color.dart';

class PriceWidget extends StatelessWidget {
  final double price;
  const PriceWidget({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Text(
          '$price XAF',
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: secondary,
          ),
        ),
      ],
    );
  }
}
