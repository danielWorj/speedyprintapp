import 'package:flutter/material.dart';
import 'package:speedy/Model/CarteVisite.dart';
import 'package:speedy/Page/Commande/utils/custom_icon_button.dart';
import 'package:speedy/Page/Commande/utils/description_widget.dart';
import 'package:speedy/Page/Commande/utils/divider_widget.dart';
import 'package:speedy/Page/Commande/utils/image_banner.dart';
import 'package:speedy/Page/Commande/utils/info_product.dart';
import 'package:speedy/Page/Commande/utils/price_widget.dart';
import 'package:speedy/color/color.dart';

import '../utils/title_product_widget.dart';

class DetailsCarteVisite extends StatefulWidget {
  final Cartevisite cartevisite;
  const DetailsCarteVisite({super.key, required this.cartevisite});

  @override
  State<DetailsCarteVisite> createState() => _DetailsCarteVisiteState();
}

class _DetailsCarteVisiteState extends State<DetailsCarteVisite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: white,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Center(child: Text('Detail ${widget.cartevisite}')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageBanner(imageUrl: "assets/f2.jpg"),
            const DividerWidget(),
            TitleProductWidget(name: widget.cartevisite.nomPrenom!),
            InfoProduct(
                localisation: widget.cartevisite.localisation!,
                entreprise: widget.cartevisite.entreprise!,
                fonction: widget.cartevisite.fonction!),
            DescriptionWidget(
              text: widget.cartevisite.description!,
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, bottom: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PriceWidget(
                    price: 10000,
                  ),
                ],
              ),
            ),
            const CustomIconButton(),
          ],
        ),
      ),
    );
  }
}
