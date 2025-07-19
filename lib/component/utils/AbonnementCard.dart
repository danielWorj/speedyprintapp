import 'package:flutter/material.dart';

class AbonnementCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget button;

  const AbonnementCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.button});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(subTitle),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [button],
            )
          ],
        ),
      ),
    );
  }
}
