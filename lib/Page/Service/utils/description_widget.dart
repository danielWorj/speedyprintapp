import 'package:flutter/material.dart';
import 'package:speedy/Page/Commande/utils/title_widget.dart';

import '../../../color/color.dart';

class DescriptionWidget extends StatelessWidget {
  final String text;
  const DescriptionWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWidget(
          title: 'Description',
          isSeeAll: false,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, bottom: 32),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              color: black,
            ),
          ),
        ),
      ],
    );
  }
}
