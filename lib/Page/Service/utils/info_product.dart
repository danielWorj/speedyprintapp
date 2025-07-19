import 'package:flutter/material.dart';
import 'package:speedy/Page/Commande/utils/text_icon_widget.dart';

class InfoProduct extends StatelessWidget {
  final String localisation;
  final String entreprise;
  final String fonction;
  const InfoProduct({
    Key? key,
    required this.localisation,
    required this.entreprise,
    required this.fonction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32, left: 18, right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextIconWidget(
            text: '${localisation}',
            icon: Icons.location_on_outlined,
          ),
          TextIconWidget(
            text: '${entreprise}',
            icon: Icons.home,
          ),
          TextIconWidget(
            text: '${fonction}',
            icon: Icons.account_box_sharp,
          ),
        ],
      ),
    );
  }
}
