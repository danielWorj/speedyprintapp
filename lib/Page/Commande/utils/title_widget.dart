import 'package:flutter/material.dart';

import '../../../color/color.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final bool isSeeAll;

  const TitleWidget({
    Key? key,
    required this.title,
    this.isSeeAll = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: primary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          isSeeAll
              ? const Text(
                  'See All',
                  style: TextStyle(
                    color: secondary,
                    fontSize: 13,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
